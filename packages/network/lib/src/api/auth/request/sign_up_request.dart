import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/common/base_request.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest implements BaseRequest {
  final String email;
  final String password;

  SignUpRequest({
    required this.email,
    required this.password,
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);

  @override
  Map<String, dynamic>? get data => {
        'email': email,
        'password': password,
      };

  @override
  FormData? get formData => null;

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  String get url => '/api/v1/sign-up';

  @override
  String get method => 'POST';

  @override
  Map<String, String>? get headers => null;
}
