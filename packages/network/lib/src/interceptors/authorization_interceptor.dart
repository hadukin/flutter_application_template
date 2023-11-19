import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network/config.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioAuthorizationInterceptor extends QueuedInterceptor {
  final Dio _dio;
  final TokensStore _tokenStore;
  final bool _isDebug;

  DioAuthorizationInterceptor({
    required Dio dio,
    required bool isDebug,
    required TokensStore tokenStore,
  })  : _dio = dio,
        _isDebug = isDebug,
        _tokenStore = tokenStore;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshTokenClient = Dio(_dio.options);
      if (_isDebug) {
        refreshTokenClient.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          compact: false,
        ));
      }
      try {
        final refreshToken = _tokenStore.value?.refresh;

        if (refreshToken != null) {
          final response = await refreshTokenClient.post(
            '/api/v1/refresh-access-token',
            data: {'refreshToken': refreshToken},
          );

          final access = response.data['accessToken'] as String;
          final refresh = response.data['refreshToken'] as String;

          _tokenStore.setValue((access: access, refresh: refresh));

          return handler.resolve(await _retry(err.requestOptions));
        }
      } on DioException catch (e) {
        super.onError(e, handler);
      } catch (e) {
        super.onError(err, handler);
      } finally {
        refreshTokenClient.close(force: true);
      }
    }
    super.onError(err, handler);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    requestOptions.headers[NetworkConfig.authHeader] = '${NetworkConfig.bearerPrefix} ${_tokenStore.value?.access}';

    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      options: options,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
