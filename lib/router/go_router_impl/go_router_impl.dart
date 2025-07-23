import 'package:domain/domain.dart';
import 'package:flutter_application_template/router/go_router_impl/go_router_config.dart';
import 'package:flutter_application_template/router/go_router_impl/go_router_navigator.dart';
import 'package:go_router/go_router.dart';

class GoRouterImpl extends IRouter<GoRouter, RouterDetails> {
  GoRouterImpl({required super.router})
    : navigator = GoRouterNavigatorImpl(router: router),
      config = GoRouterConfigImpl(router: router);

  @override
  late INavigator<RouterDetails> navigator;

  @override
  late IRouterConfig config;
}
