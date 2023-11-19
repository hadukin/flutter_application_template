import 'package:data/src/authorization/data_source/local/authorization_local_data_source.dart';
import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source.dart';
import 'package:domain/domain.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  final AuthorizationRemoteDataSource _remote;
  final AuthorizationLocalDataSource _local;

  AuthorizationRepositoryImpl({
    required AuthorizationRemoteDataSource authorizationRemoteDataSource,
    required AuthorizationLocalDataSource authorizationLocalDataSource,
  })  : _remote = authorizationRemoteDataSource,
        _local = authorizationLocalDataSource;

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _remote.signIn(
        email: email,
        password: password,
      );
      await _local.saveTokens(
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
      await _local.deleteTokens();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<TokensEntity> getTokens() {
    return _local.getTokens();
  }
}
