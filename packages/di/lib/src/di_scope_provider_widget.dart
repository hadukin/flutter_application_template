import 'package:di/di.dart';
import 'package:di/src/di_scope_provider.dart';
import 'package:flutter/widgets.dart';

class DiScopeProviderWidget<T extends BaseScope> extends StatefulWidget {
  final T scope;
  final Widget Function(BuildContext context, T scope) builder;
  final Widget? placeholder;

  const DiScopeProviderWidget({
    super.key,
    required this.scope,
    required this.builder,
    this.placeholder,
  });

  @override
  State<DiScopeProviderWidget<T>> createState() =>
      _DiScopeProviderWidgetState<T>();
}

class _DiScopeProviderWidgetState<T extends BaseScope>
    extends State<DiScopeProviderWidget<T>> {
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
      builder: (_, value, _) {
        if (!value) return widget.placeholder ?? const SizedBox.shrink();
        return DiScopeProvider<T>(
          data: widget.scope,
          child: widget.builder(context, widget.scope),
        );
      },
    );
  }
}
