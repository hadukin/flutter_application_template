import 'package:core/router/base_navigator.dart';
import 'package:core/router/types.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class GoRouterNavigatorImpl extends BaseNavigator {
  const GoRouterNavigatorImpl({
    required GoRouter router,
  }) : _router = router;

  final GoRouter _router;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _router.routerDelegate.navigatorKey;

  @override
  Future<void> pop<T extends Object?>([T? result]) async {
    _router.pop(result);
  }

  @override
  Future<T?> push<T extends Object?>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);
    return _router.push(location, extra: extra);
  }

  @override
  Future<void> navigate(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);
    return _router.go(location, extra: extra);
  }

  @override
  Future<T?> replace<T extends Object?>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);
    return _router.replace(location, extra: extra);
  }
}
