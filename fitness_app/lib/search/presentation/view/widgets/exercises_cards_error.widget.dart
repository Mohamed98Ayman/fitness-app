import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExercisesCardsError extends ConsumerWidget {
  const ExercisesCardsError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: design.sizes.s100),
          Icon(
            Icons.assignment_late_outlined,
            size: design.sizes.s80,
            color: design.colors.primaryAppColors.xD1D2D2,
          ),
          Text(
            'Something went wrong!',
            style: design.typography.s20w600xs20w600.copyWith(
              color: design.colors.primaryAppColors.xD1D2D2,
            ),
          ),
        ],
      ),
    );
  }
}
