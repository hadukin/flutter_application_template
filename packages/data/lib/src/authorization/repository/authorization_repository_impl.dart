import 'package:data/src/authorization/data_source/remote_data_source/authorization_local_data_source.dart';
import 'package:data/src/authorization/data_source/remote_data_source/authorization_remote_data_source.dart';
import 'package:domain/domain.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationRemoteDataSource _authorizationRemoteDataSource;
  final AuthorizationLocalDataSource _authorizationLocalDataSource;

  AuthorizationRepositoryImpl({
    required AuthorizationRemoteDataSource authorizationRemoteDataSource,
    required AuthorizationLocalDataSource authorizationLocalDataSource,
  })  : _authorizationRemoteDataSource = authorizationRemoteDataSource,
        _authorizationLocalDataSource = authorizationLocalDataSource;

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authorizationRemoteDataSource.signUp(
        email: email,
        password: password,
      );
      await _authorizationLocalDataSource.saveTokens(
        access: response.credentials?.access,
        refresh: response.credentials?.refresh,
      );
      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authorizationRemoteDataSource.signIn(
        email: email,
        password: password,
      );
      await _authorizationLocalDataSource.saveTokens(
        access: response.credentials?.access,
        refresh: response.credentials?.refresh,
      );

      return response;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _authorizationLocalDataSource.deleteTokens();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<Tokens> isAuthorized() {
    return _authorizationLocalDataSource.getTokens();
  }

  @override
  Future<List<UserEntity>> getUsers() {
    return _authorizationLocalDataSource.getUsers();
  }

  @override
  Future<void> saveUser(UserEntity user) async {
    _authorizationLocalDataSource.saveUser(user);
  }
}
