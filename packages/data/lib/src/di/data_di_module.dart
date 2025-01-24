import 'package:data/src/analytics/di/analytics_di_module.dart';
import 'package:data/src/authorization/di/authorization_di_module.dart';
import 'package:di/di.dart';

class DataDiModule implements BaseDiModule {
  const DataDiModule();

  @override
  Future<void> register(Di instance) async {
    final modules = [
      AnalyticsDiModule(),
      AuthorizationDiModule(),
    ];

    for (final module in modules) {
      await module.register(instance);
    }
  }
}
