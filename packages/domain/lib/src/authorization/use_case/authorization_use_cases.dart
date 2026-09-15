import 'package:domain/domain.dart';

abstract interface class AuthorizationUseCase {
  const AuthorizationUseCase();

  Future<({String? access, String? refresh})?> getTokens();

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<void> createTest();
}
