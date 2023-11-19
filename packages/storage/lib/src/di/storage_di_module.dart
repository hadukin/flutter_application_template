import 'package:di/di.dart';
import 'package:storage/src/db/database_impl.dart';
import 'package:storage/src/db/db.dart';
import 'package:storage/src/db/database.dart';
import 'package:storage/src/preferences_storage/preferences_storage.dart';
import 'package:storage/src/preferences_storage/preferences_storage_impl.dart';
import 'package:storage/src/secure_storage/secure_storage.dart';
import 'package:storage/src/secure_storage/secure_storage_impl.dart';

class StorageDiModule implements BaseDIModule {
  const StorageDiModule();

  @override
  Future<void> updateInjections(Di instance) async {
    instance.registerSingleton<SecureStorage>(SecureStorageImpl());
    instance.registerSingleton<PreferencesStorage>(PreferencesStorageImpl());
    instance.registerSingleton<Database>(DatabaseImpl(db: Db()));

    await instance.getIt<PreferencesStorage>().init();
  }
}
