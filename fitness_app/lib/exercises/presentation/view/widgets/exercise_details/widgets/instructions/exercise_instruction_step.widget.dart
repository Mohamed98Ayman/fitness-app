import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class ExerciseInstructionStep extends StatelessWidget {
  const ExerciseInstructionStep({
    super.key,
    required this.index,
    required this.instruction,
  });
  final int index;
  final String instruction;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: design.colors.primaryAppColors.x00D6D7,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: design.spacings.s8,
              vertical: design.spacings.s4,
            ),
            child: Text(
              (index + 1).toString(),
              overflow: TextOverflow.ellipsis,
              style: design.typography.s16w500xs16w500.copyWith(
                color: design.colors.primaryAppColors.xFFFFFF,
              ),
            ),
          ),
        ),
        SizedBox(width: design.spacings.s16),
        Expanded(
          child: Text(
            instruction,
            style: design.typography.s16w500xs16w500.copyWith(
              color: design.colors.primaryAppColors.xFFFFFF,
            ),
          ),
        ),
      ],
    );
  }
}
