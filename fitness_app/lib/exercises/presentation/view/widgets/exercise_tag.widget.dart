import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseTag extends ConsumerWidget {
  const ExerciseTag({super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: design.spacings.s8,
          vertical: design.spacings.s4,
        ),
        child: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: design.typography.s14w500xs14w500.copyWith(
            color: design.colors.primaryAppColors.xFFFFFF,
          ),
        ),
      ),
    );
  }
}
