import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ExercisesCardsLoading extends ConsumerWidget {
  const ExercisesCardsLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: 7,
        separatorBuilder:
            (context, index) => SizedBox(height: design.sizes.s16),
        itemBuilder:
            (context, index) => Shimmer(
              child: Container(
                height: design.sizes.s100,
                width: design.sizes.s100,
                decoration: BoxDecoration(
                  color: design.colors.primaryAppColors.xD1D2D2.withValues(
                    alpha: 0.1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
      ),
    );
  }
}
