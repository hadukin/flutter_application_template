import 'dart:async';

import 'package:di/src/di.dart';

abstract interface class BaseDiModule {
  Future<void> register(Di instance);
}

extension DiExtension on Di {
  Future<void> registerModule(BaseDiModule module) => module.register(this);
}

abstract interface class BaseScope {
  String get name => runtimeType.toString();

  bool get isReady;

  Future<bool> init(Di getit);

  FutureOr dispose();
}
