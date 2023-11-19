import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfigImpl implements BaseRouterConfig {
  const GoRouterConfigImpl({
    required GoRouter router,
    required String? initialDeepLink,
  })  : _goRouter = router,
        _initialDeepLink = initialDeepLink;

  final GoRouter _goRouter;
  final String? _initialDeepLink;

  @override
  RouteInformationParser<Object>? get routeInformationParser => _goRouter.routeInformationParser;

  @override
  RouteInformationProvider? get routeInformationProvider => _goRouter.routeInformationProvider;

  @override
  RouterDelegate<Object>? get routerDelegate => _goRouter.routerDelegate;
}
