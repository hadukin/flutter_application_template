import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/router_implementation/auto_router_impl/app_router.dart';

final class AutoRouterNavigatorImpl extends INavigator {
  const AutoRouterNavigatorImpl({
    required AppRouter router,
  }) : _router = router;

  final AppRouter _router;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _router.navigatorKey;

  @override
  Future<void> pop<T extends Object?>([T? result]) {
    return _router.maybePop(result);
  }

  @override
  Future<T?> push<T extends Object?>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);

    return _router.pushNamed(
      location,
      includePrefixMatches: true,
    );
  }

  @override
  Future<void> navigate(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);

    return _router.navigateNamed(
      location,
      includePrefixMatches: true,
    );
  }

  @override
  Future<T?> replace<T extends Object?>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  }) async {
    final location = buildPath(path, queryParams: queryArgs);
    return _router.replaceNamed(
      location,
      includePrefixMatches: true,
    );
  }
}
