import 'package:flutter/material.dart';

abstract interface class BaseRouterConfig {
  const BaseRouterConfig._();

  RouteInformationParser<Object>? get routeInformationParser;

  RouterDelegate<Object>? get routerDelegate;

  RouteInformationProvider? get routeInformationProvider;
}
