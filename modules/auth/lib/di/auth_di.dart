import 'package:auth/data/repository/auth_repository.dart';
import 'package:auth/domain/repository/auth_repository.dart';
import 'package:core/core.dart';

class AuthDiModule implements BaseDIModule {
  @override
  Future<void> updateInjections(Di instance) async {
    instance.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  }
}
