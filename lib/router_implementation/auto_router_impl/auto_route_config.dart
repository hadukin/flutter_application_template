import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/app_router.dart';

class AutoRouterConfigImpl implements BaseRouterConfig {
  const AutoRouterConfigImpl({
    required AppRouter router,
    required String? initialDeepLink,
  })  : _router = router,
        _initialDeepLink = initialDeepLink;

  final AppRouter _router;
  final String? _initialDeepLink;

  @override
  RouteInformationParser<Object>? get routeInformationParser => _router.defaultRouteParser(includePrefixMatches: true);

  @override
  RouteInformationProvider? get routeInformationProvider => _router.routeInfoProvider();

  @override
  RouterDelegate<Object>? get routerDelegate => AutoRouterDelegate(
        _router,
        deepLinkBuilder: (deepLink) async {
          return DeepLink.path(_initialDeepLink ?? '/launch');
        },
        navigatorObservers: () => [],
      );
}
