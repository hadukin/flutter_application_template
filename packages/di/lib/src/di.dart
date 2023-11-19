import 'dart:async';

import 'package:get_it/get_it.dart';

part 'di_impl.dart';

abstract final class Di {
  static final Di _instance = _DiImpl();

  Di._();

  static Di get instance => _instance;

  void registerSingleton<T extends Object>(T instance, {String? instanceName});

  void registerLazySingleton<T extends Object>(T instance);

  void registerFactory<T extends Object>(T Function() factoryFunc);

  Future<void> unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr<dynamic> Function(T)? disposingFunction,
  });

  bool isRegistered<T extends Object>({Object? instance, String? instanceName});

  T getIt<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });
}
