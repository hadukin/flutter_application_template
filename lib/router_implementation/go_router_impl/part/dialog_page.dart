import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogPage<T> extends Page<T> {
  const DialogPage({required this.child, super.key});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => DialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          child: child,
        ),
      );
}

class CupertinoDialogPage<T> extends Page<T> {
  const CupertinoDialogPage({required this.child, super.key});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) => CupertinoDialogRoute<T>(
        context: context,
        settings: this,
        builder: (context) => Dialog(
          child: child,
        ),
      );
}
