import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_instruction_step.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseInstructions extends ConsumerWidget {
  const ExerciseInstructions({super.key, required this.instructions});
  final List<String> instructions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return ListView.separated(
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
    );
  }
}
