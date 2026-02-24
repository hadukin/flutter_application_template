//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_di_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:data/src/analytics/analytics_service_impl.dart' as _i108;
import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart'
    as _i601;
import 'package:data/src/authorization/data_source/local/authorization_local_data_source_impl.dart'
    as _i44;
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source.dart'
    as _i747;
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source_impl.dart'
    as _i69;
import 'package:data/src/authorization/repository/authorization_repository_impl.dart'
    as _i729;
import 'package:data/src/store/user_store.dart' as _i63;
import 'package:data/src/todo/data_source/local/todo_local_data_source.dart'
    as _i781;
import 'package:data/src/todo/data_source/local/todo_local_data_source_impl.dart'
    as _i303;
import 'package:data/src/todo/repository/todo_repository_impl.dart' as _i657;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;
import 'package:network/network.dart' as _i372;
import 'package:storage/storage.dart' as _i431;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.singleton<_i63.UserStore>(() => _i63.UserStore());
    gh.singleton<_i781.TodoLocalDataSource>(
        () => _i303.TodoLocalDataSourceImpl(db: gh<_i431.Database>()));
    gh.singleton<_i747.AuthorizationRemoteDataSource>(
        () => _i69.AuthorizationRemoteDataSourceImpl(api: gh<_i372.AuthApi>()));
    gh.singleton<_i601.AuthorizationLocalDataSource>(() =>
        _i44.AuthorizationLocalDataSourceImpl(
            secureStorage: gh<_i431.SecureStorage>()));
    gh.singleton<_i494.AuthorizationRepository>(
        () => _i729.AuthorizationRepositoryImpl(
              authorizationRemoteDataSource:
                  gh<_i747.AuthorizationRemoteDataSource>(),
              authorizationLocalDataSource:
                  gh<_i601.AuthorizationLocalDataSource>(),
            ));
    gh.singleton<_i494.AnalyticsService>(() => _i108.AnalyticsServiceImpl(
        providers: gh<List<_i494.AnalyticsProvider>>()));
    gh.singleton<_i494.TodoRepository>(() => _i657.TodoRepositoryImpl(
        todoLocalDataSource: gh<_i781.TodoLocalDataSource>()));
  }
}
