import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DebugAnalyticProvider implements AnalyticsProvider {
  @override
  Future<void> init() async {
    Log.i.debug('ANALYTICS IS INIT');
  }

  @override
  void track(String name, {required Map<String, Object> params}) {
    Log.i.debug('ANALYTICS | event - { name:$name, params: $params }');
  }

  @override
  void setUserId(String userId) {
    Log.i.debug('ANALYTICS | set user id ${userId}');
  }

  @override
  void clearUserId() {
    Log.i.debug('ANALYTICS | clear user');
  }

  @override
  void setUserProperty({required String name, required String value}) {
    Log.i.debug('ANALYTICS | user property - { name:$name, value:$value }');
  }
}
