import 'package:network/src/common/base_request.dart';

abstract interface class ClientProvider {
  Future<dynamic> request(BaseRequest request);
}
