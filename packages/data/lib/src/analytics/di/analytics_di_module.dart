import 'package:data/src/analytics/analytics_service_impl.dart';
import 'package:data/src/analytics/debug_analytic_provider.dart';
import 'package:di/di.dart';
import 'package:domain/domain.dart';

class AnalyticsDiModule implements BaseDiModule {
  @override
  Future<void> register(Di instance) async {
    instance.registerSingleton<AnalyticsService>(AnalyticsServiceImpl(
      providers: [DebugAnalyticProvider()],
    ));
  }
}
