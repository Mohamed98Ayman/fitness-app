import 'package:flutter/material.dart';

extension BottomModalHelper on BuildContext {
  Future<T?> showBottomModalSheet<T>(
    Widget child, {
    bool isScrollControlled = true,
    bool useSafeArea = true,
    Color? backgroundColor,
  }) async => await showModalBottomSheet(
    context: this,
    builder: (_) => child,
    showDragHandle: true,
    useSafeArea: useSafeArea,
    isScrollControlled: isScrollControlled,

    useRootNavigator: true,
    backgroundColor: backgroundColor,
  );
}
