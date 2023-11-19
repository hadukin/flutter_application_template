import 'package:flutter/material.dart';

abstract interface class IRouterConfig {
  const IRouterConfig._();

  RouteInformationParser<Object>? get routeInformationParser;

  RouterDelegate<Object>? get routerDelegate;

  RouteInformationProvider? get routeInformationProvider;
}
