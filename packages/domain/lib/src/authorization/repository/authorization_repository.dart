import 'package:domain/domain.dart';

abstract interface class AuthorizationRepository {
  Future<UserEntity> signUp({
    required String email,
    required String password,
  });

  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<TokensEntity> getTokens();

  Future<List<UserEntity>> getUsers();

  Future<void> saveUser(UserEntity user);
}
