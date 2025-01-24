import 'package:domain/domain.dart';
import 'package:network/network.dart';

abstract class UserMapper {
  static UserEntity transform(UserDto dto) {
    return UserEntity(
      email: dto.email,
      credentials: (
        access: dto.accessToken,
        refresh: dto.refreshToken,
      ),
    );
  }
}
