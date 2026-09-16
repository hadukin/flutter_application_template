import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';
import 'package:data/src/authorization/data_source/local/authorization_local_data_source_impl.dart';
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source.dart';
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source_impl.dart';
import 'package:data/src/authorization/repository/authorization_repository_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';

class AuthorizationDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerLazySingleton<AuthorizationRemoteDataSource>(
      AuthorizationRemoteDataSourceImpl(api: instance.getIt()),
    );

    instance.registerLazySingleton<AuthorizationLocalDataSource>(
      AuthorizationLocalDataSourceImpl(tokenManager: instance.getIt()),
    );

    instance.registerLazySingleton<AuthorizationRepository>(
      AuthorizationRepositoryImpl(
        authorizationRemoteDataSource: instance.getIt(),
        authorizationLocalDataSource: instance.getIt(),
      ),
    );

    instance.registerFactory<LoginUseCase>(
      () => LoginUseCase(repository: instance.getIt()),
    );
    instance.registerFactory<LogoutUseCase>(
      () => LogoutUseCase(repository: instance.getIt()),
    );
    instance.registerFactory<TestUseCase>(
      () => TestUseCase(repository: instance.getIt()),
    );
  }
}
