import 'package:network/src/common/request_method.dart';

abstract interface class BaseRequest {
  const BaseRequest();

  RequestMethod get method;

  String get url;

  Map<String, dynamic>? get queryParameters;

  Map<String, dynamic>? get data;

  Map<String, String>? get headers;
}
