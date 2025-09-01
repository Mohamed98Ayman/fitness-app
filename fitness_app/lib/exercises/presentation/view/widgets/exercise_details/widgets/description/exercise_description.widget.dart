import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class ExerciseDescription extends StatelessWidget {
  const ExerciseDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "description",
          maxLines: 2,
          style: design.typography.s18w700xs18w700.copyWith(
            color: design.colors.primaryAppColors.xFFFFFF,
          ),
        ),
        SizedBox(height: design.spacings.s8),
        Text(
          description,
          style: design.typography.s16w500xs16w500.copyWith(
            color: design.colors.primaryAppColors.xD1D2D2,
          ),
        ),
      ],
    );
  }
}
