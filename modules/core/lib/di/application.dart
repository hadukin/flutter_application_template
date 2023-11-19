import 'package:core/di/di.dart';
import 'package:core/di/di_impl.dart';

abstract class Application {
  final Di di = DiImpl();
  Future<void> init();

  T get<T extends Object>() {
    return di.getIt<T>();
  }
}
