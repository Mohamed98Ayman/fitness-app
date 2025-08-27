import 'package:fitness_app/design_system/colors/primary_app_colors.model.dart';
import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows({required this.sh1});

  final List<BoxShadow> sh1;

  factory AppShadows.withColors(PrimaryAppColors colors) {
    return AppShadows(
      sh1: [
        BoxShadow(
          color: colors.x000000,
          offset: const Offset(0, 2),
          blurRadius: 2,
        ),
      ],
    );
  }
}
