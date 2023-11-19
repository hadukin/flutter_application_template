import 'package:data/src/authorization/api/dto/user_dto.dart';
import 'package:network/interface/rest_client_provider.dart';
import 'package:uuid/uuid.dart';

abstract interface class AuthorizationApi {
  Future<UserDto> signUp({
    required String email,
    required String password,
  });

  Future<UserDto> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}

class AuthorizationApiImpl implements AuthorizationApi {
  final RestClientProvider _clientProvider;

  AuthorizationApiImpl({
    required RestClientProvider clientProvider,
  }) : _clientProvider = clientProvider;

  @override
  Future<UserDto> signUp({
    required String email,
    required String password,
  }) async {
    try {
      // Example request
      // final result = await _clientProvider.post<Map<String, dynamic>>(
      //   'api/v1/sign-up',
      //   data: {
      //     'email': email,
      //     'password': password,
      //   },
      // );

      return UserDto(
        email: 'test@test.com',
        accessToken: const Uuid().v4(),
        refreshToken: const Uuid().v4(),
      );
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  @override
  Future<UserDto> signIn({required String email, required String password}) async {
    // Example request
    // final result = await _clientProvider.post<Map<String, dynamic>>(
    //   'api/v1/sign-in',
    //   data: {
    //     'email': email,
    //     'password': password,
    //   },
    // );

    return UserDto(
      email: 'test@test.com',
      accessToken: const Uuid().v4(),
      refreshToken: const Uuid().v4(),
    );
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
