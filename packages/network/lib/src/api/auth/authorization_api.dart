import 'package:network/src/api/auth/dto/user_dto.dart';

abstract interface class AuthApi {
  Future<UserDto> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
