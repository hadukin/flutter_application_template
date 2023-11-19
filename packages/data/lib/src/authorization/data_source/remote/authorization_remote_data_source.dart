import 'package:domain/domain.dart';

abstract interface class AuthorizationRemoteDataSource {
  Future<UserEntity> signUp({
    required String email,
    required String password,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
