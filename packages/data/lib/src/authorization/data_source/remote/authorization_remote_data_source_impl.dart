import 'package:data/src/authorization/data_source/remote/authorization_remote_data_source.dart';
import 'package:data/src/authorization/mappers/user_mapper.dart';
import 'package:domain/domain.dart';
import 'package:network/network.dart';

class AuthorizationRemoteDataSourceImpl implements AuthorizationRemoteDataSource {
  final AuthApi _api;

  AuthorizationRemoteDataSourceImpl({
    required AuthApi api,
  }) : _api = api;

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    final dto = await _api.signUp(email: email, password: password);

    return UserMapper.transform(dto);
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final dto = await _api.signIn(email: email, password: password);

    return UserMapper.transform(dto);
  }

  @override
  Future<void> signOut() async {
    await _api.signOut();
  }
}
