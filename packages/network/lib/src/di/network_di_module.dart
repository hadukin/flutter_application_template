import 'package:di/di.dart';
import 'package:dio/dio.dart';
import 'package:network/network.dart';
import 'package:network/src/api/auth/authorization_api_impl.dart';
import 'package:network/src/client/dio_client/impl/dio_client_provider_impl.dart';
import 'package:network/src/client/dio_client/client_provider.dart';
import 'package:network/src/client/interceptors/authorization_interceptor.dart';
import 'package:network/src/common/network_config.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

class NetworkDiModule implements BaseDiModule {
  const NetworkDiModule();

  @override
  Future<void> register(Di instance) async {
    final dio = Dio(BaseOptions(baseUrl: NetworkConfig.baseUrl));

    final List<Interceptor> interceptors = [
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: true,
          printResponseMessage: true,
        ),
      ),
      DioAuthorizationInterceptor(
        dio: dio,
        tokenManager: instance.getIt(),
        onAuthExpired: () {},
      ),
    ];

    dio.interceptors.addAll(interceptors);

    instance.registerSingleton<ClientProvider>(
      DioClientProviderImpl(dio: dio, tokenManager: instance.getIt()),
    );

    instance.registerSingleton<AuthApi>(AuthApiImpl(client: instance.getIt()));
  }
}
