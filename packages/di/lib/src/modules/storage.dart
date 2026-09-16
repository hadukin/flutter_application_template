// import 'package:di/di.dart';
// import 'package:storage/storage.dart';

// class StorageDiModule implements BaseDiModule {
//   const StorageDiModule();

//   @override
//   Future<void> register(Di instance) async {
//     instance.registerSingleton<SecureStorage>(SecureStorageImpl());
//     instance.registerSingleton<PreferencesStorage>(PreferencesStorageImpl());
//     instance.registerSingleton<Database>(DatabaseImpl(db: Db.defaults()));
//     await instance.getIt<PreferencesStorage>().init();

//     instance.registerSingleton<TokenStorage>(
//       TokenStorageImpl(secureStorage: instance.getIt()),
//     );
//     instance.registerSingleton<TokenManager>(
//       TokenManagerImpl(storage: instance.getIt()),
//     );

//     instance.getIt<TokenManager>().init();
//   }
// }
