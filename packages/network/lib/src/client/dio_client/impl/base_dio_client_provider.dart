import 'package:network/src/client/dio_client/client_provider.dart';
import 'package:network/src/common/network_config.dart';

abstract base class BaseDioClientProvider implements ClientProvider {
  Map<String, dynamic> buildHeaders({
    String? accessToken,
    required Map<String, String>? headers,
  }) {
    // if (accessToken != null) {NetworkConfig.authHeader: '${NetworkConfig.bearerPrefix} $accessToken';};
    // Headers.contentTypeHeader: Headers.jsonContentType,
    // Headers.acceptHeader: Headers.jsonContentType,

    return {
      if (accessToken != null) NetworkConfig.authHeader: '${NetworkConfig.bearerPrefix} $accessToken',
    };
  }
}
