import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AnalyticsService)
final class AnalyticsServiceImpl extends BaseAnalyticsService {
  AnalyticsServiceImpl({required super.providers});
}
