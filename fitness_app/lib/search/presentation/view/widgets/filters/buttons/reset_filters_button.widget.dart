import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetFilterButton extends ConsumerWidget {
  const ResetFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return GestureDetector(
      onTap: () => ref.read(appliedFiltersController.notifier).resetFilters(),
      child: Container(
        decoration: BoxDecoration(
          color: design.colors.primaryAppColors.xFF5C28,
          borderRadius: BorderRadius.circular(design.sizes.s16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: design.spacings.s8,
            vertical: design.spacings.s4,
          ),
          child: Text(
            "Reset",
            style: design.typography.s12w500xs12w500.copyWith(
              color: design.colors.primaryAppColors.xFFFFFF,
            ),
          ),
        ),
      ),
    );
  }
}
