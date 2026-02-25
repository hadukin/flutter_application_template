import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';
import 'package:data/src/authorization/data_source/local/authorization_local_data_source_impl.dart';
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source.dart';
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source_impl.dart';
import 'package:data/src/authorization/repository/authorization_repository_impl.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';
import 'package:use_case/use_case.dart';

class AuthorizationDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerLazySingleton<AuthorizationRemoteDataSource>(
      AuthorizationRemoteDataSourceImpl(
        api: instance.getIt(),
      ),
    );

    instance.registerLazySingleton<AuthorizationLocalDataSource>(
      AuthorizationLocalDataSourceImpl(
        secureStorage: instance.getIt(),
      ),
    );

    instance.registerLazySingleton<AuthorizationRepository>(
      AuthorizationRepositoryImpl(
        authorizationRemoteDataSource: instance.getIt(),
        authorizationLocalDataSource: instance.getIt(),
      ),
    );

    instance.registerLazySingleton<AuthorizationUseCase>(AuthorizationUseCaseImpl(repository: instance.getIt()));
  }
}
