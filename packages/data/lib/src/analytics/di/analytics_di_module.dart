import 'package:data/src/analytics/base_analytics_service_impl.dart';
import 'package:data/src/analytics/debug_analytic_provider.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';

class AnalyticsDiModule implements BaseDIModule {
  @override
  Future<void> updateInjections(Di instance) async {
    instance.registerSingleton<AnalyticsService>(BaseAnalyticsServiceImpl(
      providers: {
        DebugAnalyticProvider(),
      },
    ));
  }
}
