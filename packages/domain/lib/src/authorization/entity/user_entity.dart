import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String email,
    required Tokens credentials,
  }) = _UserEntity;
}
