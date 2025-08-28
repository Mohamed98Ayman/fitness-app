import 'package:fitness_app/common/application/extensions/locale.extension.dart';
import 'package:fitness_app/design_system/colors/app_colors.model.dart';
import 'package:fitness_app/design_system/gradients/nawy_gradients.model.dart';
import 'package:fitness_app/design_system/shadows/nawy_shadows.model.dart';
import 'package:fitness_app/design_system/sizes/sizes.model.dart';
import 'package:fitness_app/design_system/spacings/spacings.model.dart';
import 'package:fitness_app/design_system/typography/typography.model.dart';
import 'package:flutter/material.dart';

class AppDesignSystem extends ThemeExtension<AppDesignSystem> {
  final AppColors colors;
  final AppTypography typography;
  final AppSpacings spacings;
  final AppSizes sizes;
  final AppGradients gradients;
  final AppShadows shadows;

  AppDesignSystem({
    required this.colors,
    required this.typography,
    required this.spacings,
    required this.sizes,
    required this.gradients,
    required this.shadows,
  });

  factory AppDesignSystem.variant({
    required ThemeMode themeMode,
    required Locale locale,
  }) {
    final colors =
        themeMode == ThemeMode.light ? AppColors.light() : AppColors.dark();
    return AppDesignSystem(
      gradients: AppGradients.withColors(colors.primaryAppColors),
      colors: colors,
      typography:
          locale.isEnglish
              ? AppTypography.english(fontFamily: 'Poppins', lineHeight: 1.5)
              : AppTypography.arabic(fontFamily: 'AlMarai', lineHeight: 1.5),
      spacings: AppSpacings.base(),
      shadows: AppShadows.withColors(colors.primaryAppColors),
      sizes: AppSizes.base(),
    );
  }

  @override
  AppDesignSystem copyWith() => this;

  @override
  AppDesignSystem lerp(ThemeExtension<AppDesignSystem>? other, double t) =>
      this;
}
