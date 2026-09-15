abstract interface class TokenManager {
  Future<void> init();
  Future<({String? access, String? refresh})?> read();
  Future<void> write({required String? access, required String? refresh});
  Future<void> delete();
  ({String? access, String? refresh})? get tokens;
  Stream<({String? access, String? refresh})?> get stream;
}
