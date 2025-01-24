import 'package:di/src/di.dart';

abstract interface class BaseDIModule {
  Future<void> register(Di instance);
}

extension DiExtension on Di {
  Future<void> registerModule(BaseDIModule module) => module.register(this);
}
