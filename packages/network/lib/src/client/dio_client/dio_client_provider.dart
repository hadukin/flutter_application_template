import 'package:network/src/common/base_request.dart';

abstract interface class DioClientProvider {
  Future<dynamic> request(BaseRequest request);
}
