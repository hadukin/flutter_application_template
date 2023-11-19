import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network/src/api/auth/authorization_api.dart';
import 'package:network/src/api/auth/authorization_api_impl.dart';
import 'package:network/src/client/dio_client/impl/dio_client_provider_impl.dart';
import 'package:network/src/client/dio_client/dio_client_provider.dart';
import 'package:network/src/client/rest_client/rest_client_provider.dart';
import 'package:network/src/client/rest_client/impl/rest_client_provider_impl.dart';
import 'package:network/src/interceptors/authorization_interceptor.dart';
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
  Future<void> updateInjections(Di instance) async {
    final tokenStore = Di.instance.getIt<TokensStore>();

    final dio = Dio(BaseOptions(baseUrl: _baseUrl));

    final List<Interceptor> interceptors = [
      if (_isDebug) PrettyDioLogger(requestHeader: true, requestBody: true, compact: false),
      DioAuthorizationInterceptor(
        dio: dio,
        tokenStore: tokenStore,
        isDebug: _isDebug,
      ),
    ];

    dio.interceptors.addAll(interceptors);

    instance.registerSingleton<RestClientProvider>(RestClientProviderImpl(
      dio: dio,
      tokenStore: tokenStore,
      baseUrl: _baseUrl,
    ));

    instance.registerSingleton<DioClientProvider>(
      DioClientProviderImpl(
        dio: dio,
        tokenStore: tokenStore,
      ),
    );

    instance.registerSingleton<AuthApi>(AuthApiImpl(
      client: instance.getIt(),
      restClient: instance.getIt(),
    ));
  }
}
