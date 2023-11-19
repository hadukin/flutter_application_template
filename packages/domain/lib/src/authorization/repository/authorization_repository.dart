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

  Future<Tokens> isAuthorized();

  Future<List<UserEntity>> getUsers();

  Future<void> saveUser(UserEntity user);
}
