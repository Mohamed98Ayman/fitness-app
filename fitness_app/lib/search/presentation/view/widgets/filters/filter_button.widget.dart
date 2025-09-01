import 'package:fitness_app/design_system/design_systems.extension.dart';

import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isSelected = false,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color:
              isSelected
                  ? design.colors.primaryAppColors.x00D6D7
                  : design.colors.primaryAppColors.x22242C,
          borderRadius: BorderRadius.circular(design.sizes.s16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: design.spacings.s8,
            vertical: design.spacings.s4,
          ),
          child: Text(
            title,
            style: design.typography.s12w500xs12w500.copyWith(
              color:
                  isSelected
                      ? design.colors.primaryAppColors.xFFFFFF
                      : design.colors.primaryAppColors.xF5F5F5.withValues(
                        alpha: 0.7,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
