import 'package:di/src/di.dart';

abstract interface class BaseDiModule {
  Future<void> register(Di instance);
}

extension DiExtension on Di {
  Future<void> registerModule(BaseDiModule module) => module.register(this);
}
