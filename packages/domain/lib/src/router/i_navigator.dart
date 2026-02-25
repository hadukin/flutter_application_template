import 'dart:async';

import 'types.dart';
import 'package:flutter/widgets.dart';

abstract base class INavigator<D> with RouterQueryBuilderMixin {
  INavigator();

  GlobalKey<NavigatorState> get navigatorKey;

  Future<T?> push<T>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  });

  Future<void> navigate(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  });

  Future<void> pop<T>([T? result]);

  Future<T?> replace<T>(
    String path, {
    QueryArgs queryArgs = const {},
    Object? extra,
  });

  final controller = StreamController<D>();

  Stream<D> get state => controller.stream.asBroadcastStream();
}
