abstract interface class TokenStorage {
  Future<({String? access, String? refresh})?> read();
  Future<void> write({required String? access, required String? refresh});
  Future<void> delete();
}
