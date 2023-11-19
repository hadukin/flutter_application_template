import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network/config.dart';
import 'package:network/src/common/base_response.dart';
import 'package:network/src/common/request_method.dart';
import 'package:network/src/client/rest_client/impl/base_rest_client_provider.dart';

final class RestClientProviderImpl extends BaseRestClientProvider {
  final Dio _dio;
  final TokensStore _tokenStore;

  RestClientProviderImpl({
    required Dio dio,
    required TokensStore tokenStore,
    required super.baseUrl,
  })  : _dio = dio,
        _tokenStore = tokenStore;

  Future<BaseResponse<T?>> _request<T>(
    String path,
    RequestMethodType method, {
    dynamic data,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParameters,
    void Function(int, int)? onReceiveProgress,
    String contentType = 'application/json',
  }) async {
    final options = Options(
      headers: {
        if (_tokenStore.value?.access != null)
          NetworkConfig.authHeader: '${NetworkConfig.bearerPrefix} ${_tokenStore.value?.access}',
      },
      contentType: contentType,
      method: method.name,
    );

    try {
      final response = await _dio.request<T>(
        path,
        data: data,
        options: options,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );

      return BaseResponse<T?>(
        data: response.data,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(e, e.stackTrace);
      }
      Error.throwWithStackTrace(e, e.stackTrace);
    } catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  @override
  Future<BaseResponse<T?>> get<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  }) =>
      _request(
        path,
        RequestMethodType.GET,
        data: data,
        contentType: contentType,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );

  @override
  Future<BaseResponse<T?>> post<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  }) =>
      _request(
        path,
        RequestMethodType.POST,
        data: data,
        contentType: contentType,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );

  @override
  Future<BaseResponse<T?>> patch<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  }) =>
      _request(
        path,
        RequestMethodType.PATCH,
        data: data,
        contentType: contentType,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );

  @override
  Future<BaseResponse<T?>> put<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  }) =>
      _request(
        path,
        RequestMethodType.PUT,
        data: data,
        contentType: contentType,
        headers: headers,
        onReceiveProgress: onReceiveProgress,
        queryParameters: queryParameters,
      );

  @override
  Future<BaseResponse<T?>> download<T>(
    String path,
    String savePath, {
    dynamic data,
    RequestMethodType method = RequestMethodType.GET,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  }) async {
    final uri = buildUri(path: path, queryParams: queryParameters);
    final body = data;
    final options = Options(
      headers: headers,
      contentType: contentType,
      method: method.name,
    );

    final response = await _dio.download(
      uri.toString(),
      savePath,
      data: body,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: queryParameters,
    );

    return BaseResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
