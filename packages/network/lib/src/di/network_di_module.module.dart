//@GeneratedMicroModule;NetworkPackageModule;package:network/src/di/network_di_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:network/src/api/auth/authorization_api.dart' as _i474;
import 'package:network/src/api/auth/authorization_api_impl.dart' as _i164;
import 'package:network/src/client/dio_client/client_provider.dart' as _i656;
import 'package:network/src/client/dio_client/impl/dio_client_provider_impl.dart'
    as _i518;
import 'package:network/src/common/token_store.dart' as _i705;

class NetworkPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i705.TokenStore>(() => _i705.TokenStore());
    gh.singleton<_i656.ClientProvider>(
        () => _i518.DioClientProviderImpl(tokenStore: gh<_i372.TokenStore>()));
    gh.singleton<_i474.AuthApi>(
        () => _i164.AuthApiImpl(client: gh<_i656.ClientProvider>()));
  }
}
