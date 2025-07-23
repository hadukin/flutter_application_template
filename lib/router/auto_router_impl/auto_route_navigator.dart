import 'dart:async';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_template/router/auto_router_impl/app_router.dart';

final class AutoRouterNavigatorImpl extends INavigator<RouterDetails> {
  AutoRouterNavigatorImpl({required AppRouter router}) : _router = router {
    _router.addListener(() {
      controller.add(RouterDetails(uri: Uri(), path: _router.currentPath));
    });
  }

  final AppRouter _router;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _router.navigatorKey;

  @override
  Future<void> pop<T extends Object?>([T? result]) {
    return _router.maybePop(result);
  }

  @override
  Future<T?> push<T extends Object?>(String path, {QueryArgs queryArgs = const {}, Object? extra}) async {
    final location = buildPath(path, queryParams: queryArgs);

    return _router.pushPath(location, includePrefixMatches: true);
  }

  @override
  Future<void> navigate(String path, {QueryArgs queryArgs = const {}, Object? extra}) async {
    final location = buildPath(path, queryParams: queryArgs);

    return _router.navigatePath(location, includePrefixMatches: true);
  }

  @override
  Future<T?> replace<T extends Object?>(String path, {QueryArgs queryArgs = const {}, Object? extra}) async {
    final location = buildPath(path, queryParams: queryArgs);
    return _router.replacePath(location, includePrefixMatches: true);
  }
}
