//@GeneratedMicroModule;StoragePackageModule;package:storage/src/di/storage_di_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:storage/src/db/database.dart' as _i978;
import 'package:storage/src/db/database_impl.dart' as _i150;
import 'package:storage/src/db/db.dart' as _i824;
import 'package:storage/src/preferences_storage/preferences_storage.dart'
    as _i153;
import 'package:storage/src/preferences_storage/preferences_storage_impl.dart'
    as _i735;
import 'package:storage/src/secure_storage/secure_storage.dart' as _i1026;
import 'package:storage/src/secure_storage/secure_storage_impl.dart' as _i935;

class StoragePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) async {
    gh.factory<_i824.Db>(() => _i824.Db.defaults());
    await gh.factoryAsync<_i153.PreferencesStorage>(
      () {
        final i = _i735.PreferencesStorageImpl();
        return i.init().then((_) => i);
      },
      preResolve: true,
    );
    gh.singleton<_i1026.SecureStorage>(() => _i935.SecureStorageImpl());
    gh.singleton<_i978.Database>(() => _i150.DatabaseImpl(db: gh<_i824.Db>()));
  }
}
