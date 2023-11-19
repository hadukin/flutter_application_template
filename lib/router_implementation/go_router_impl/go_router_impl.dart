import 'package:core/router/base_navigator.dart';
import 'package:core/router/base_router.dart';
import 'package:core/router/base_router_config.dart';
import 'package:flutter_application_template/router_implementation/go_router_impl/go_router_config.dart';
import 'package:flutter_application_template/router_implementation/go_router_impl/go_router_navigator.dart';
import 'package:go_router/go_router.dart';

class GoRouterImpl implements BaseRouter {
  final GoRouter router;
  final String? initialDeepLink;

  GoRouterImpl({
    required this.router,
    required this.initialDeepLink,
  })  : navigator = GoRouterNavigatorImpl(router: router),
        config = GoRouterConfigImpl(router: router, initialDeepLink: initialDeepLink);

  @override
  late BaseNavigator navigator;

  @override
  late BaseRouterConfig config;
}
