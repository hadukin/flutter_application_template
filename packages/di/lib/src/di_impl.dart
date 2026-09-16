part of 'di.dart';

final _getIt = GetIt.instance;

final class _DiImpl implements Di {
  @override
  Future<void> ensureInitialized() async {
    final modules = [
      const StorageDiModule(),
      const NetworkDiModule(),
      const DataDiModule(),
    ];

    for (final module in modules) {
      await registerModule(module);
    }
  }

  @override
  T getIt<T extends Object>({String? instanceName, param1, param2}) {
    return _getIt.get<T>();
  }

  @override
  void registerSingleton<T extends Object>(T instance, {String? instanceName}) {
    _getIt.registerSingleton(instance, instanceName: instanceName);
  }

  @override
  void registerLazySingleton<T extends Object>(
    T instance, {
    String? instanceName,
  }) {
    _getIt.registerLazySingleton(() => instance, instanceName: instanceName);
  }

  @override
  void registerFactory<T extends Object>(
    T Function() factoryFunc, {
    String? instanceName,
  }) {
    _getIt.registerFactory(factoryFunc, instanceName: instanceName);
  }

  @override
  Future<void> unregister<T extends Object>({
    Object? instance,
    String? instanceName,
    FutureOr Function(T value)? disposingFunction,
  }) async {
    _getIt.unregister(
      instance: instance,
      instanceName: instanceName,
      disposingFunction: disposingFunction,
    );
  }

  @override
  bool isRegistered<T extends Object>({
    Object? instance,
    String? instanceName,
  }) {
    return _getIt.isRegistered(instance: instance, instanceName: instanceName);
  }

  @override
  Future<BaseScope?> pushScope(BaseScope scope) async {
    if (_scopes.contains(scope.name)) return scope;

    await _getIt.pushNewScopeAsync(
      scopeName: scope.name,
      init: (_) async {
        await scope.init(this);
      },
      dispose: scope.dispose,
    );

    _scopes.add(scope.name);

    return scope;
  }

  @override
  Future<void> dropScope(String name) async {
    _scopes.remove(name);
    await _getIt.dropScope(name);
  }

  Set<String> _scopes = {};
}
