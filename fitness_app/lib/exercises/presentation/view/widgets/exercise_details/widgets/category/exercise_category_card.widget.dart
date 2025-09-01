import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class ExerciseCategory extends StatelessWidget {
  const ExerciseCategory({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return Container(
      decoration: BoxDecoration(
        color: design.colors.primaryAppColors.x22242C,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(design.spacings.s16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: design.typography.s16w500xs16w500.copyWith(
                color: design.colors.primaryAppColors.xD1D2D2,
              ),
            ),
            SizedBox(height: design.spacings.s16),
            Text(
              subTitle,
              style: design.typography.s16w500xs16w500.copyWith(
                color: design.colors.primaryAppColors.xFFFFFF,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
