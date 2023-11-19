abstract interface class Di {
  void registerSingleton<T extends Object>(T instance);
  void registerLazySingleton<T extends Object>(T instance);

  T getIt<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });
}

abstract class BaseDIModule {
  Future<void> updateInjections(Di instance);
}

// abstract class Application {
//   final Di di = DiImpl();
//   Future<void> init();

//   T get<T extends Object>() {
//     return di.getIt<T>();
//   }
// }

// final class DiImpl implements Di {
//   final _getIt = GetIt.instance;

//   @override
//   T getIt<T extends Object>({String? instanceName, param1, param2}) {
//     return _getIt.get<T>();
//   }

//   @override
//   void registerSingleton<T extends Object>(T instance) {
//     _getIt.registerSingleton(instance);
//   }

//   @override
//   void registerLazySingleton<T extends Object>(T instance) {
//     _getIt.registerSingleton(instance);
//   }
// }


// final class DiProvider {
//   DiProvider({required this.di});

//   late Di di;

//   static final DiProvider _instance = DiProvider._();

//   DiProvider._(this.di);

//   static DiProvider get instance => _instance;
// }

// final class DiProvider {
//   late Di di;

//   static final DiProvider _inst = DiProvider._internal();

//   DiProvider._internal();

//   factory DiProvider({required Di di}) {
//     _inst.di = di;
//     return _inst;
//   }
// }

// abstract class Application {
//   final Di di = DiImpl();

//   static final Application _instance = _ApplicationImpl();

//   Application._();

//   static Application get instance => _instance;

//   Future<void> init();

//   // static final Application _instance = _ApplicationImpl();
//   // static Application get instance => _instance;

//   // factory Application.asNewInstance() {
//   //   return _ApplicationImpl();
//   // }
// }

// class _ApplicationImpl implements Application {
//   @override
//   Di get di => DiImpl();

//   @override
//   Future<void> init() async {}
// }
