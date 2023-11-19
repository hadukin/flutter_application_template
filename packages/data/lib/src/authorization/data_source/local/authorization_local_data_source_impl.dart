import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';
import 'package:domain/domain.dart';
import 'package:storage/storage.dart';

final class AuthorizationLocalDataSourceImpl implements AuthorizationLocalDataSource {
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';

  final SecureStorage _secureStorage;

  AuthorizationLocalDataSourceImpl({
    required SecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  Future<TokensEntity> getTokens() async {
    final access = await _secureStorage.read(_accessTokenKey);
    final refresh = await _secureStorage.read(_refreshTokenKey);

    if (access == null || refresh == null) return null;

    return (access: access, refresh: refresh);
  }

  @override
  Future<void> saveTokens({required String? access, required String? refresh}) async {
    if (access == null || refresh == null) return;

    await _secureStorage.write(_accessTokenKey, access);
    await _secureStorage.write(_refreshTokenKey, refresh);
  }

  @override
  Future<void> deleteTokens() async {
    await _secureStorage.delete(_accessTokenKey);
    await _secureStorage.delete(_refreshTokenKey);
  }
}
