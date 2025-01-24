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
    instance.registerSingleton<AuthorizationRemoteDataSource>(
      AuthorizationRemoteDataSourceImpl(
        api: instance.getIt(),
      ),
    );

    instance.registerSingleton<AuthorizationLocalDataSource>(
      AuthorizationLocalDataSourceImpl(
        secureStorage: instance.getIt(),
        db: instance.getIt(),
      ),
    );

    instance.registerSingleton<AuthorizationRepository>(
      AuthorizationRepositoryImpl(
        authorizationRemoteDataSource: instance.getIt(),
        authorizationLocalDataSource: instance.getIt(),
      ),
    );

    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(
          repository: instance.getIt(),
        ));
    instance.registerFactory<SignOutUseCase>(() => SignOutUseCase(
          repository: instance.getIt(),
        ));
    instance.registerFactory<SignInUseCase>(() => SignInUseCase(
          repository: instance.getIt(),
        ));
    instance.registerFactory<GetTokensFromLocalStorageUseCase>(
      () => GetTokensFromLocalStorageUseCase(repository: instance.getIt()),
    );
    instance.registerFactory<GetAllUserUseCase>(
      () => GetAllUserUseCase(repository: instance.getIt()),
    );
  }
}
