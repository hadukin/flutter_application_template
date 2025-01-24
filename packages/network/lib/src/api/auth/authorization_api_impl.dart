import 'package:network/src/api/auth/authorization_api.dart';
import 'package:network/src/api/auth/dto/user_dto.dart';
import 'package:network/src/api/auth/request/sign_up_request.dart';
import 'package:network/src/client/dio_client/client_provider.dart';

final class AuthApiImpl implements AuthApi {
  final ClientProvider _client;

  AuthApiImpl({
    required ClientProvider client,
  }) : _client = client;

  @override
  Future<UserDto> signUp({
    required String email,
    required String password,
  }) async {
    final result = await _client.request(SignUpRequest(email: email, password: password));

    return UserDto(
      email: 'fake@email.com',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    );
  }

  @override
  Future<UserDto> signIn({
    required String email,
    required String password,
  }) async {
    return UserDto(
      email: 'fake@email.com',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    );
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
