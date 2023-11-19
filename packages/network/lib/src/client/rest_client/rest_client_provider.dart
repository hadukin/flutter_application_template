import 'package:network/src/common/base_response.dart';

abstract interface class RestClientProvider {
  Future<BaseResponse<T?>> get<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  });

  Future<BaseResponse<T?>> post<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  });

  Future<BaseResponse<T?>> patch<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  });

  Future<BaseResponse<T?>> put<T>(
    String path, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  });

  Future<BaseResponse<T?>> download<T>(
    String path,
    String savePath, {
    dynamic data,
    Map<String, Object?>? headers,
    void Function(int, int)? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    String contentType = 'application/json',
  });
}
