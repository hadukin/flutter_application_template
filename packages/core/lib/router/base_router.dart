import 'package:core/router/base_navigator.dart';
import 'package:core/router/base_router_config.dart';

abstract interface class BaseRouter {
  // Provides navigation methods
  //
  // The method should be used to navigate in the app
  BaseNavigator get navigator;

  // Provides configuration methods
  //
  // The method should be used to provide the app routing configuration,
  BaseRouterConfig get config;
}
