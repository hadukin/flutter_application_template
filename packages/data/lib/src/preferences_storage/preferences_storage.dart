abstract interface class PreferencesStorage {
  const PreferencesStorage();

  Future<void> init();

  Future<void> setBool(String key, bool value, {bool isEncrypted = false});
  Future<void> setString(String key, String value, {bool isEncrypted = false});
  Future<void> setDouble(String key, double value, {bool isEncrypted = false});
  Future<void> setInt(String key, int value, {bool isEncrypted = false});
  Future<void> setStringList(String key, List<String> value, {bool isEncrypted = false});

  Future<bool?> getBool(String key);
  Future<String?> getString(String key);
  Future<double?> getDouble(String key);
  Future<int?> getInt(String key);
  Future<List<String>?> getStringList(String key);
}
