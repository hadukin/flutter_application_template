import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/api/auth/authorization_api_impl.dart';
import 'package:network/src/client/dio_client/impl/dio_client_provider_impl.dart';
import 'package:network/src/client/dio_client/client_provider.dart';
import 'package:network/src/client/interceptors/authorization_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetworkDiModule implements BaseDIModule {
  final bool _isDebug;
  final String _baseUrl;

  const NetworkDiModule({
    required bool isDebug,
    required String baseUrl,
  })  : _baseUrl = baseUrl,
        _isDebug = isDebug;

  @override
  Future<void> register(Di instance) async {
    instance.registerSingleton<TokenStore>(TokenStore());

    final dio = Dio(BaseOptions(baseUrl: _baseUrl));

    final List<Interceptor> interceptors = [
      if (_isDebug) PrettyDioLogger(requestHeader: true, requestBody: true, compact: false),
      DioAuthorizationInterceptor(
        dio: dio,
        isDebug: _isDebug,
        tokenStore: instance.getIt(),
      ),
    ];

    dio.interceptors.addAll(interceptors);

    instance.registerSingleton<ClientProvider>(
      DioClientProviderImpl(
        dio: dio,
        tokenStore: instance.getIt(),
      ),
    );

    instance.registerSingleton<AuthApi>(AuthApiImpl(
      client: instance.getIt(),
    ));
  }
}
