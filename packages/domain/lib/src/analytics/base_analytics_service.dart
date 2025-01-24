import 'package:domain/domain.dart';

abstract base class BaseAnalyticsService implements AnalyticsService {
  final List<AnalyticsProvider> _providers;

  BaseAnalyticsService({required List<AnalyticsProvider> providers}) : _providers = providers;

  @override
  void track(
    String name, {
    Map<String, Object> params = const <String, Object>{},
  }) {
    for (final provider in _providers) {
      provider.track(name, params: params);
    }
  }

  @override
  void setUserId(String userId) {
    for (final provider in _providers) {
      provider.setUserId(userId);
    }
  }

  @override
  void clearUserId() {
    for (final provider in _providers) {
      provider.clearUserId();
    }
  }

  @override
  void setUserProperty({required String name, required String value}) {
    for (final provider in _providers) {
      provider.setUserProperty(name: name, value: value);
    }
  }

  @override
  Future<void> init() async {
    for (final provider in _providers) {
      await provider.init();
    }
  }
}
