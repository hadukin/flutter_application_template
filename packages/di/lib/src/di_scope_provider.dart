import 'package:di/di.dart';
import 'package:flutter/widgets.dart';

class DiScopeProvider<T extends BaseScope> extends InheritedWidget {
  final T data;

  const DiScopeProvider({super.key, required this.data, required super.child});

  static DiScopeProvider<T>? maybeOf<T extends BaseScope>(
    BuildContext context,
  ) {
    return context.dependOnInheritedWidgetOfExactType<DiScopeProvider<T>>();
  }

  static DiScopeProvider<T> of<T extends BaseScope>(BuildContext context) {
    final DiScopeProvider<T>? result = maybeOf<T>(context);
    assert(result != null, 'No DataInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DiScopeProvider oldWidget) {
    return data != oldWidget.data;
  }
}
