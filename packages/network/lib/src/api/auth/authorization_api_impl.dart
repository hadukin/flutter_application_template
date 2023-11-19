import 'package:network/src/api/auth/authorization_api.dart';
import 'package:network/src/api/auth/dto/user_dto.dart';
import 'package:network/src/client/dio_client/dio_client_provider.dart';
import 'package:network/src/client/rest_client/rest_client_provider.dart';

final class AuthApiImpl implements AuthApi {
  final DioClientProvider _client;
  final RestClientProvider _restClient;

  AuthApiImpl({
    required DioClientProvider client,
    required RestClientProvider restClient,
  })  : _client = client,
        _restClient = restClient;

  @override
  Future<UserDto> signUp({
    required String email,
    required String password,
  }) async {
    // final result = await _client.request(SignUpRequest(email: email, password: password));

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
    // final result = await _client.request(SignUpRequest(email: email, password: password));

    return UserDto(
      email: 'fake@email.com',
      accessToken: 'accessToken',
      refreshToken: 'refreshToken',
    );
  }

  @override
  Future<void> signOut() async {
    // final result = await _client.request(SignUpRequest(email: email, password: password));
  }
}
