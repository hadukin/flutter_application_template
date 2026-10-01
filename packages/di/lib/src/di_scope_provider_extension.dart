import 'package:di/di.dart';
import 'package:flutter/material.dart';

import 'di_scope_provider.dart';

extension DiScopeProviderBuildContext on BuildContext {
  DiScopeProvider<T>? scope<T extends BaseScope>() {
    return DiScopeProvider.maybeOf<T>(this);
  }
}
