import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network/entity/base_response.dart';
import 'package:network/entity/request_method.dart';
import 'package:network/impl/base_rest_client_provider.dart';

final class RestClientProviderDioImpl extends BaseRestClientProvider {
  final Dio _dio;
  final TokensStore _tokenStore;

  RestClientProviderDioImpl({
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
    final uri = buildUri(path: path, queryParams: queryParameters);
    final body = await buildData(data);

    final options = Options(
      headers: {
        ...?headers,
        if (_tokenStore.value?.access != null) 'Authorization': 'Bearer ${_tokenStore.value?.access}',
      },
      contentType: contentType,
      method: method.name,
    );

    try {
      final response = await _dio.request<T>(
        uri.toString(),
        data: body,
        options: options,
        onReceiveProgress: onReceiveProgress,
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
      if (e.response != null) {
        return BaseResponse(
          data: e.response?.data,
          statusCode: e.response?.statusCode,
        );
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
    final body = await buildData(data);
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
    );

    return BaseResponse<T?>(
      data: response.data,
      statusCode: response.statusCode,
    );
  }
}
