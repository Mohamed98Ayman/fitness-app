import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/secondary_muscle/exercise_secondary_muscle.widget.dart';
import 'package:flutter/material.dart';

class ExerciseExerciseMuscles extends StatelessWidget {
  const ExerciseExerciseMuscles({super.key, required this.secondaryMuscles});
  final List<String> secondaryMuscles;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return secondaryMuscles.isEmpty
        ? SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Secondary Muscles",
              style: design.typography.s18w700xs18w700.copyWith(
                color: design.colors.primaryAppColors.xFFFFFF,
              ),
            ),
            SizedBox(height: design.sizes.s8),
            SizedBox(
              height: design.sizes.s30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder:
                    (context, index) =>
                        ExerciseSecondaryMuscle(title: secondaryMuscles[index]),
                separatorBuilder:
                    (context, index) => SizedBox(width: design.spacings.s4),
                itemCount: secondaryMuscles.length,
              ),
            ),
          ],
        );
  }
}
