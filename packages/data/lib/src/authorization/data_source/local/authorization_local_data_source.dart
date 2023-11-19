import 'package:domain/domain.dart';

abstract interface class AuthorizationLocalDataSource {
  Future<TokensEntity> getTokens();

  Future<void> saveTokens({required String? access, required String? refresh});

  Future<void> deleteTokens();
}
