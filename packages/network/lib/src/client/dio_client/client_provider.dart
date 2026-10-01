import 'package:network/src/common/base_request.dart';
import 'package:network/src/common/base_response.dart';

abstract interface class ClientProvider {
  const ClientProvider();
  Future<BaseResponse> request(BaseRequest request);
}
