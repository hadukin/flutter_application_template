import 'package:core/router/base_navigator.dart';
import 'package:core/router/base_router.dart';
import 'package:core/router/base_router_config.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/app_router.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/auto_route_config.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/auto_route_navigator.dart';

class AutoRouterImpl implements BaseRouter {
  final AppRouter router;
  final String? initialDeepLink;

  AutoRouterImpl({
    required this.router,
    required this.initialDeepLink,
  })  : navigator = AutoRouterNavigatorImpl(router: router),
        config = AutoRouterConfigImpl(
          router: router,
          initialDeepLink: initialDeepLink,
        );

  @override
  late BaseNavigator navigator;

  @override
  late BaseRouterConfig config;
}
