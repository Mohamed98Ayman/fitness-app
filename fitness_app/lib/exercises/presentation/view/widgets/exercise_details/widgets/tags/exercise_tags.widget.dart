import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_tag.widget.dart';
import 'package:flutter/material.dart';

class ExerciseTags extends StatelessWidget {
  const ExerciseTags({
    super.key,
    required this.category,
    required this.difficulty,
  });
  final String category;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return Row(
      children: [
        ExerciseTag(
          title: category,
          color: design.colors.primaryAppColors.x00D6D7,
        ),
        SizedBox(width: design.spacings.s8),
        ExerciseTag(
          title: difficulty,
          color: design.colors.primaryAppColors.x2C7CEE,
        ),
      ],
    );
  }
}
