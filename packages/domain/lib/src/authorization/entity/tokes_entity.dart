import 'package:freezed_annotation/freezed_annotation.dart';

part 'tokes_entity.freezed.dart';

@freezed
class TokensEntity with _$TokensEntity {
  const factory TokensEntity({
    required String access,
    required String refresh,
  }) = _TokensEntity;
}

typedef Tokens = ({String? access, String? refresh})?;
