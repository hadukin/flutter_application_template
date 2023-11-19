import 'package:data/src/authorization/api/dto/user_dto.dart';
import 'package:domain/domain.dart';

abstract class UserMapper {
  static UserEntity toEntity(UserDto dto) {
    return UserEntity(
      email: dto.email,
      credentials: (
        access: dto.accessToken,
        refresh: dto.refreshToken,
      ),
    );
  }
}
