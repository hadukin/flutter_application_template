import 'package:network/src/common/base_request.dart';
import 'package:network/src/common/base_response.dart';

abstract interface class ClientProvider {
  Future<BaseResponse> request(BaseRequest request);
}
