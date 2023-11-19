import 'package:data/src/analytics/di/analytics_di_module.dart';
import 'package:data/src/authorization/di/authorization_di_module.dart';
import 'package:data/src/db/di.dart';
import 'package:data/src/preferences_storage/preferences_storage.dart';
import 'package:data/src/preferences_storage/preferences_storage_impl.dart';
import 'package:data/src/secure_storage/secure_storage.dart';
import 'package:data/src/secure_storage/secure_storage_impl.dart';
import 'package:di/di.dart';

class DataDiModule implements BaseDIModule {
  const DataDiModule();

  @override
  Future<void> updateInjections(Di instance) async {
    instance.registerSingleton<SecureStorage>(SecureStorageImpl());
    instance.registerSingleton<PreferencesStorage>(PreferencesStorageImpl());

    final modules = [
      DatabaseDiModule(),
      AnalyticsDiModule(),
      AuthorizationDiModule(),
    ];

    for (final module in modules) {
      await module.updateInjections(instance);
    }
  }
}
