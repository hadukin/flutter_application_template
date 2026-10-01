import 'dart:async';

import 'package:di/src/di.dart';
import 'package:get_it/get_it.dart';

abstract interface class BaseDiModule {
  const BaseDiModule();

  Future<void> register(Di instance);
}

extension DiExtension on Di {
  Future<void> registerModule(BaseDiModule module) => module.register(this);
}

abstract interface class BaseScope implements Disposable {
  String get name;

  bool get isReady;

  Future<bool> init(Di getit);

  FutureOr dispose();
}
