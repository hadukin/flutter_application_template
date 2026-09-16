import 'package:di/di.dart';
import 'package:flutter/widgets.dart';

class DiScopeInheritedWidget<T extends BaseScope> extends InheritedWidget {
  final T data;

  const DiScopeInheritedWidget({
    super.key,
    required this.data,
    required super.child,
  });

  static DiScopeInheritedWidget<T>? maybeOf<T extends BaseScope>(
    BuildContext context,
  ) {
    return context
        .dependOnInheritedWidgetOfExactType<DiScopeInheritedWidget<T>>();
  }

  static DiScopeInheritedWidget<T> of<T extends BaseScope>(
    BuildContext context,
  ) {
    final DiScopeInheritedWidget<T>? result = maybeOf<T>(context);
    assert(result != null, 'No DataInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DiScopeInheritedWidget oldWidget) {
    return data != oldWidget.data;
  }
}

extension DataInheritedWidgetBuildContext on BuildContext {
  DiScopeInheritedWidget<T>? scope<T extends BaseScope>() {
    return DiScopeInheritedWidget.maybeOf<T>(this);
  }
}

class DiScopeProvider<T extends BaseScope> extends StatefulWidget {
  final T scope;
  final Widget Function(BuildContext context, T scope) builder;
  final Widget? placeholder;

  const DiScopeProvider({
    super.key,
    required this.scope,
    required this.builder,
    this.placeholder,
  });

  @override
  State<DiScopeProvider<T>> createState() => _DiScopeProviderState<T>();
}

class _DiScopeProviderState<T extends BaseScope>
    extends State<DiScopeProvider<T>> {
  final _isReady = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Di.instance.pushScope(widget.scope);
      if (!mounted) return;
      _isReady.value = true;
    });
  }

  @override
  void dispose() {
    Di.instance.dropScope(widget.scope.name);
    _isReady.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isReady,
      builder: (_, value, child) {
        if (!value) return widget.placeholder ?? const SizedBox.shrink();
        return DiScopeInheritedWidget<T>(
          data: widget.scope,
          child: widget.builder(context, widget.scope),
        );
      },
    );
  }
}
