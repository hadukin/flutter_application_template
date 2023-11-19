import 'package:di/src/di.dart';

abstract interface class BaseDIModule {
  Future<void> updateInjections(Di instance);
}

extension DiExtension on Di {
  Future<void> installModule(BaseDIModule module) => module.updateInjections(this);
}
