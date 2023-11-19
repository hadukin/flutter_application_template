import 'package:data/src/authorization/api/authorization_api.dart';
import 'package:data/src/authorization/api/mappers/user_mapper.dart';
import 'package:domain/domain.dart';

abstract interface class AuthorizationRemoteDataSource {
  Future<UserEntity> signUp({required String email, required String password});

  Future<UserEntity> signIn({required String email, required String password});

  Future<void> signOut();
}

class AuthorizationRemoteDataSourceImpl implements AuthorizationRemoteDataSource {
  final AuthorizationApi _api;

  AuthorizationRemoteDataSourceImpl({
    required AuthorizationApi api,
  }) : _api = api;

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final dto = await _api.signUp(email: email, password: password);
      return UserMapper.toEntity(dto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> signIn({required String email, required String password}) async {
    try {
      final dto = await _api.signIn(email: email, password: password);
      return UserMapper.toEntity(dto);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _api.signOut();
  }
}
