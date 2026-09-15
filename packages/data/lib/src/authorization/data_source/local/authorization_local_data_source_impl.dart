import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';
import 'package:domain/domain.dart';
import 'package:storage/storage.dart';

final class AuthorizationLocalDataSourceImpl implements AuthorizationLocalDataSource {
  final TokenManager _tokenManager;

  AuthorizationLocalDataSourceImpl({
    required TokenManager tokenManager,
  }) : _tokenManager = tokenManager;

  @override
  Future<TokensEntity> getTokens() async {
    final pair = await _tokenManager.read();
    if (pair?.access == null || pair?.refresh == null) return null;
    return (access: pair?.access, refresh: pair?.refresh);
  }

  @override
  Future<void> saveTokens({required String? access, required String? refresh}) async {
    if (access == null || refresh == null) return;
    await _tokenManager.write(access: access, refresh: refresh);
  }

  @override
  Future<void> deleteTokens() async {
    await _tokenManager.delete();
  }
}
