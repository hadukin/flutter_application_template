import 'package:flutter/material.dart';

class ModalBottomSheetPage<T> extends Page<T> {
  const ModalBottomSheetPage({
    required this.child,
    this.useSafeArea = true,
    this.isDismissible = true,
    this.isEnableDrag = true,
    this.shape,
    this.backgroundColor,
    super.key,
  });

  final Widget child;
  final bool useSafeArea;
  final bool isDismissible;
  final bool isEnableDrag;
  final Color? backgroundColor;
  final ShapeBorder? shape;

  @override
  Route<T> createRoute(BuildContext context) => ModalBottomSheetRoute<T>(
        settings: this,
        isScrollControlled: true,
        enableDrag: isEnableDrag,
        isDismissible: isDismissible,
        useSafeArea: useSafeArea,
        backgroundColor: backgroundColor,
        shape: shape,
        builder: (context) => child,
      );
}
