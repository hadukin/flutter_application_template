import 'package:json_annotation/json_annotation.dart';
import 'package:network/src/common/base_request.dart';
import 'package:network/src/common/request_method.dart';

@JsonSerializable()
final class CreateTestRequest implements BaseRequest {
  const CreateTestRequest();

  @override
  Map<String, dynamic>? get data => {};

  @override
  Map<String, dynamic>? get queryParameters => null;

  @override
  String get url => '/v1/tournament';

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  Map<String, String>? get headers => null;
}
