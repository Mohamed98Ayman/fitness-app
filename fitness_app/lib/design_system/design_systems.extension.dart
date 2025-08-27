import 'package:fitness_app/design_system/app_design_system.model.dart';
import 'package:flutter/material.dart';

extension DesignSystemHelpers on BuildContext {
  AppDesignSystem get design => Theme.of(this).extension<AppDesignSystem>()!;
}
