import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/instructions/exercise_instruction_step.widget.dart';
import 'package:flutter/material.dart';

class ExerciseInstructions extends StatelessWidget {
  const ExerciseInstructions({super.key, required this.instructions});
  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return instructions.isEmpty
        ? SizedBox.shrink()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Instructions",
              style: design.typography.s18w700xs18w700.copyWith(
                color: design.colors.primaryAppColors.xFFFFFF,
              ),
            ),
            SizedBox(height: design.sizes.s16),
            ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder:
                  (context, index) => ExerciseInstructionStep(
                    index: index,
                    instruction: instructions[index],
                  ),
              separatorBuilder:
                  (context, index) => SizedBox(height: design.spacings.s8),
              itemCount: instructions.length,
            ),
          ],
        );
  }
}
