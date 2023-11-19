import 'package:core/di/di.dart';
import 'package:get_it/get_it.dart';

final class DiImpl implements Di {
  final _getIt = GetIt.instance;

  @override
  T getIt<T extends Object>({String? instanceName, param1, param2}) {
    return _getIt.get<T>();
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    _getIt.registerSingleton(instance);
  }

  @override
  void registerLazySingleton<T extends Object>(T instance) {
    _getIt.registerSingleton(instance);
  }
}
