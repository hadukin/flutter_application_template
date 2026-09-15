import 'package:domain/domain.dart';

abstract interface class AuthorizationRepository {
  Future<UserEntity> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<({String? access, String? refresh})?> getTokens();

  Future<void> createTest();
}
