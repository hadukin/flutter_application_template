abstract interface class TokenStorage {
  const TokenStorage();
  Future<({String? access, String? refresh})?> read();
  Future<void> write({required String? access, required String? refresh});
  Future<void> delete();
}
