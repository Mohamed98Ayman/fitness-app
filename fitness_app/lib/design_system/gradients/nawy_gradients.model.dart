import 'package:fitness_app/design_system/colors/primary_app_colors.model.dart';
import 'package:flutter/material.dart';

class AppGradients {
  const AppGradients({required this.g1});

  final Gradient g1;

  factory AppGradients.withColors(PrimaryAppColors colors) {
    return AppGradients(
      g1: LinearGradient(
        colors: [colors.x000000, colors.xFFFFFF],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    );
  }
}
