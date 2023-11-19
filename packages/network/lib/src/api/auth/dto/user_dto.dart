import 'package:domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto implements Transformable<UserEntity> {
  final String email;
  final String accessToken;
  final String refreshToken;

  UserDto({
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  @override
  UserEntity transform() {
    return UserEntity(
      email: email,
      credentials: (access: accessToken, refresh: refreshToken),
    );
  }
}
