import 'package:data/src/db/i_database.dart';
import 'package:data/src/secure_storage/secure_storage.dart';
import 'package:domain/domain.dart';

abstract interface class AuthorizationLocalDataSource {
  Future<Tokens> getTokens();

  Future<void> saveTokens({required String? access, required String? refresh});

  Future<void> deleteTokens();

  Future<void> saveUser(UserEntity user);

  Future<UserEntity> getUserByEmail(String email);

  Future<List<UserEntity>> getUsers();
}

final class AuthorizationLocalDataSourceImpl implements AuthorizationLocalDataSource {
  final _accessTokenKey = 'ACCESS_TOKEN';
  final _refreshTokenKey = 'REFRESH_TOKEN';
  final IDatabase _db;

  final SecureStorage _secureStorage;

  AuthorizationLocalDataSourceImpl({
    required SecureStorage secureStorage,
    required IDatabase db,
  })  : _db = db,
        _secureStorage = secureStorage;

  @override
  Future<Tokens> getTokens() async {
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

  @override
  Future<void> saveUser(UserEntity user) async {
    await _db.users.add(user);
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    final result = await _db.users.getAll();

    return result
        .map((userDatabase) => UserEntity(
              email: userDatabase.email,
              credentials: (
                access: userDatabase.accessToken,
                refresh: userDatabase.refreshToken,
              ),
            ))
        .toList();
  }

  @override
  Future<UserEntity> getUserByEmail(String email) async {
    final result = await _db.users.getUserById(email);

    return UserEntity(
      email: result.email,
      credentials: (
        access: result.accessToken,
        refresh: result.refreshToken,
      ),
    );
  }
}
