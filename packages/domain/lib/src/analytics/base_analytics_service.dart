abstract interface class BaseAnalyticsService {
  Future<void> init();
  void track(String name, {required Map<String, Object> params});
  void clearUserId();
  void setUserId(String userId);
  void setUserProperty({required String name, required String value});
}
