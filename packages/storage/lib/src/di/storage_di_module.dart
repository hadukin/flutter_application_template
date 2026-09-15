import 'package:di/di.dart';
import 'package:storage/src/db/database_impl.dart';
import 'package:storage/src/db/db.dart';
import 'package:storage/src/db/database.dart';
import 'package:storage/src/storages/token_manager/token_manager.dart';
import 'package:storage/src/storages/token_manager/token_manager_impl.dart';
import 'package:storage/src/storages/token_storage/token_storage.dart';
import 'package:storage/src/storages/token_storage/token_storage_impl.dart';
import 'package:storage/src/preferences_storage/preferences_storage.dart';
import 'package:storage/src/preferences_storage/preferences_storage_impl.dart';
import 'package:storage/src/secure_storage/secure_storage.dart';
import 'package:storage/src/secure_storage/secure_storage_impl.dart';

class StorageDiModule implements BaseDiModule {
  const StorageDiModule();

  @override
  Future<void> register(Di instance) async {
    instance.registerSingleton<SecureStorage>(SecureStorageImpl());
    instance.registerSingleton<PreferencesStorage>(PreferencesStorageImpl());
    instance.registerSingleton<Database>(DatabaseImpl(db: Db.defaults()));
    await instance.getIt<PreferencesStorage>().init();

    instance.registerSingleton<TokenStorage>(TokenStorageImpl(secureStorage: instance.getIt()));
    instance.registerSingleton<TokenManager>(TokenManagerImpl(storage: instance.getIt()));

    instance.getIt<TokenManager>().init();
  }
}
