import 'package:dio/dio.dart';
import 'package:network/config.dart';
import 'package:network/src/client/dio_client/dio_client_provider.dart';
import 'package:network/src/common/base_request.dart';

abstract base class BaseDioClientProvider implements DioClientProvider {
  Map<String, dynamic> buildHeaders({
    BaseRequest? request,
    String? accessToken,
    required Map<String, String>? headers,
  }) {
    return {
      Headers.contentTypeHeader: Headers.jsonContentType,
      Headers.acceptHeader: Headers.jsonContentType,
      if (accessToken != null) NetworkConfig.authHeader: '${NetworkConfig.bearerPrefix} $accessToken',
    };
  }
}
