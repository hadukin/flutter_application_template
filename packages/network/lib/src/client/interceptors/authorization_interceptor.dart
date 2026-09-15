import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:storage/storage.dart';

class DioAuthorizationInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final TokenManager _tokenManager;
  final VoidCallback onAuthExpired;
  Completer<String?>? _refreshCompleter;

  DioAuthorizationInterceptor({
    required Dio dio,
    required TokenManager tokenManager,
    required this.onAuthExpired,
  })  : _dio = dio,
        _tokenManager = tokenManager;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Добавляем токен в заголовки для всех запросов, кроме запроса на обновление токена
    if (options.path != '/v1/internal/refresh' &&
        _tokenManager.tokens?.access != null &&
        _tokenManager.tokens?.access?.length != 0) {
      options.headers['Authorization'] = 'Bearer ${_tokenManager.tokens?.access}';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Если это не 401 Unauthorized или нет refresh токена, пропускаем дальше
    if (err.response?.statusCode != 401 || _tokenManager.tokens?.refresh == null) {
      return handler.next(err);
    }

    // Пытаемся обновить токен
    try {
      // Если обновление еще не началось, начинаем его
      if (_refreshCompleter == null) {
        _refreshCompleter = Completer<String?>();
        try {
          final newAccessToken = await _refreshToken();
          _refreshCompleter?.complete(newAccessToken);
        } catch (e) {
          _refreshCompleter?.completeError(e);
          _refreshCompleter = null;
          onAuthExpired(); // Уведомляем о необходимости выйти из системы
          return handler.next(err);
        }
        _refreshCompleter = null;
      } else {
        // Ожидаем завершения уже начатого обновления
        await _refreshCompleter?.future;
      }

      // После успешного обновления токена повторяем исходный запрос
      final newAccessToken = _tokenManager.tokens?.access;
      if (newAccessToken != null && newAccessToken.isNotEmpty) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';
        final response = await _dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } else {
        return handler.next(err);
      }
    } catch (e) {
      onAuthExpired(); // Уведомляем о необходимости выйти из системы
      return handler.next(err);
    }
  }

  /// Выполняет запрос на обновление токена с использованием `cleanDio`
  Future<String?> _refreshToken() async {
    final refreshTokenClient = Dio(_dio.options);

    refreshTokenClient.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
    ));

    try {
      final response = await refreshTokenClient.post(
        '/v1/internal/refresh',
        data: {'refresh_token': _tokenManager.tokens?.refresh},
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      if (newAccessToken != null && newAccessToken.isNotEmpty) {
        await _tokenManager.write(access: newAccessToken, refresh: newRefreshToken);
        return newAccessToken;
      } else {
        throw Exception('Failed to refresh token: invalid response');
      }
    } catch (e) {
      _tokenManager.delete();
      throw Exception('Failed to refresh token: $e');
    } finally {
      refreshTokenClient.close(force: true);
    }
  }
}
