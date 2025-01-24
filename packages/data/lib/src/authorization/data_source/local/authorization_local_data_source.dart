import 'package:domain/domain.dart';

abstract interface class AuthorizationLocalDataSource {
  Future<TokensEntity> getTokens();

  Future<void> saveTokens({required String? access, required String? refresh});

  Future<void> deleteTokens();

  Future<void> saveUser(UserEntity user);

  Future<UserEntity> getUserByEmail(String email);

  Future<List<UserEntity>> getUsers();
}
