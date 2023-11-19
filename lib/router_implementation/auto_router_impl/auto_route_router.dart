import 'package:domain/domain.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/app_router.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/auto_route_config.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/auto_route_navigator.dart';

class AutoRouterImpl extends IRouter<AppRouter> {
  AutoRouterImpl({
    required super.router,
  })  : navigator = AutoRouterNavigatorImpl(router: router),
        config = AutoRouterConfigImpl(
          router: router,
          initialDeepLink: '/launch',
        );

  @override
  late INavigator navigator;

  @override
  late IRouterConfig config;
}
