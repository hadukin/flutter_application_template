import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterConfigImpl implements IRouterConfig {
  const GoRouterConfigImpl({required GoRouter router}) : _goRouter = router;

  final GoRouter _goRouter;

  @override
  RouteInformationParser<Object>? get routeInformationParser => _goRouter.routeInformationParser;

  @override
  RouteInformationProvider? get routeInformationProvider => _goRouter.routeInformationProvider;

  @override
  RouterDelegate<Object>? get routerDelegate => _goRouter.routerDelegate;
}
