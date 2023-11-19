import 'package:data/src/preferences_storage/preferences_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesStorageImpl implements PreferencesStorage {
  late final SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> setBool(String key, bool value, {bool isEncrypted = false}) async {
    await _preferences.setBool(key, value);
  }

  @override
  Future<void> setString(String key, String value, {bool isEncrypted = false}) async {
    await _preferences.setString(key, value);
  }

  @override
  Future<void> setDouble(String key, double value, {bool isEncrypted = false}) async {
    await _preferences.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value, {bool isEncrypted = false}) async {
    await _preferences.setInt(key, value);
  }

  @override
  Future<void> setStringList(String key, List<String> value, {bool isEncrypted = false}) async {
    await _preferences.setStringList(key, value);
  }

  @override
  Future<bool?> getBool(String key) async => _preferences.getBool(key);

  @override
  Future<double?> getDouble(String key) async => _preferences.getDouble(key);

  @override
  Future<int?> getInt(String key) async => _preferences.getInt(key);

  @override
  Future<String?> getString(String key) async => _preferences.getString(key);

  @override
  Future<List<String>?> getStringList(String key) async => _preferences.getStringList(key);
}
