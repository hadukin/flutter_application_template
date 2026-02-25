import 'package:network/src/api/auth/authorization_api.dart';
import 'package:network/src/api/auth/dto/user_dto.dart';
import 'package:network/src/api/auth/request/sign_in_request.dart';
import 'package:network/src/client/dio_client/client_provider.dart';

final class AuthApiImpl implements AuthApi {
  final ClientProvider _client;

  AuthApiImpl({
    required ClientProvider client,
  }) : _client = client;

  @override
  Future<UserDto> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _client.request(SignInRequest(email: email, password: password));

    return UserDto.fromJson(response.data);
  }

  @override
  Future<void> signOut() async {
    throw UnimplementedError();
  }
}
