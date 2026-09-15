import 'package:storage/src/secure_storage/secure_storage.dart';
import 'package:storage/src/storages/token_storage/token_storage.dart';

class TokenStorageImpl implements TokenStorage {
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';

  final SecureStorage _secureStorage;

  TokenStorageImpl({
    required SecureStorage secureStorage,
  }) : _secureStorage = secureStorage;

  @override
  Future<({String? access, String? refresh})?> read() async {
    final access = await _secureStorage.read(_accessTokenKey);
    final refresh = await _secureStorage.read(_refreshTokenKey);

    if (access == null || refresh == null) return null;

    return (access: access, refresh: refresh);
  }

  @override
  Future<void> write({required String? access, required String? refresh}) async {
    if (access == null || refresh == null) return;
    await Future.wait([
      _secureStorage.write(_accessTokenKey, access),
      _secureStorage.write(_refreshTokenKey, refresh),
    ]);
  }

  @override
  Future<void> delete() async {
    await Future.wait([
      _secureStorage.delete(_accessTokenKey),
      _secureStorage.delete(_refreshTokenKey),
    ]);
  }
}
