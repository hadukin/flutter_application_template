import 'i_navigator.dart';
import 'i_router_config.dart';

abstract class IRouter<T> {
  const IRouter({required T router});

  INavigator get navigator;

  IRouterConfig get config;
}
