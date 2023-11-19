import 'package:core/di/di.dart';

extension DiExtension on Di {
  Future<void> installModule(BaseDIModule module) =>
      module.updateInjections(this);
}
