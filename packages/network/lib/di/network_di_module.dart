import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:network/impl/dio_provider_impl.dart';
import 'package:network/interceptors/authorization_interceptor.dart';
import 'package:network/interface/rest_client_provider.dart';
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

    instance.registerSingleton<RestClientProvider>(RestClientProviderDioImpl(
      dio: dio
        ..interceptors.addAll([
          if (_isDebug) PrettyDioLogger(requestHeader: true, requestBody: true, compact: false),
          DioAuthorizationInterceptor(
            dio: dio,
            tokenStore: tokenStore,
            isDebug: _isDebug,
          ),
        ]),
      tokenStore: tokenStore,
      baseUrl: _baseUrl,
    ));
  }
}
