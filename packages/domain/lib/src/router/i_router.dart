import 'i_navigator.dart';
import 'i_router_config.dart';

abstract class IRouter<T, D> {
  const IRouter({required T router});

  INavigator<D> get navigator;

  IRouterConfig get config;
}
