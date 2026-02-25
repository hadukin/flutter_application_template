// import 'package:di/di.dart';
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:network/network.dart';
// import 'package:network/src/api/auth/authorization_api_impl.dart';
// import 'package:network/src/client/dio_client/impl/dio_client_provider_impl.dart';
// import 'package:network/src/client/dio_client/client_provider.dart';
// import 'package:network/src/client/interceptors/authorization_interceptor.dart';
// import 'package:network/src/common/network_config.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class NetworkDiModule implements BaseDiModule {
//   const NetworkDiModule();

//   @override
//   Future<void> register(Di instance) async {
//     instance.registerSingleton<TokenStore>(TokenStore());

//     final dio = Dio(BaseOptions(baseUrl: NetworkConfig.baseUrl));

//     final List<Interceptor> interceptors = [
//       PrettyDioLogger(requestHeader: true, requestBody: true, compact: false),
//       DioAuthorizationInterceptor(
//         dio: dio,
//         tokenStore: instance.getIt(),
//       ),
//     ];

//     dio.interceptors.addAll(interceptors);

//     instance.registerSingleton<ClientProvider>(
//       DioClientProviderImpl(
//         dio: dio,
//         tokenStore: instance.getIt(),
//       ),
//     );

//     instance.registerSingleton<AuthApi>(AuthApiImpl(
//       client: instance.getIt(),
//     ));
//   }
// }

import 'package:injectable/injectable.dart';

@InjectableInit.microPackage()
Future<void> initMicroPackage() async {}
