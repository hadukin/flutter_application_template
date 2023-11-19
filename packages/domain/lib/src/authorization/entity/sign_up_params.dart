import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_params.freezed.dart';

@freezed
abstract class SignUpParams with _$SignUpParams {
  const factory SignUpParams({
    required String email,
    required String password,
  }) = _SignUpParams;
}
