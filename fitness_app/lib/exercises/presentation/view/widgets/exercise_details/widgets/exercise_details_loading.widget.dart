import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ExerciseDetailsLoading extends ConsumerWidget {
  const ExerciseDetailsLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final design = context.design;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Shimmer(
            child: Container(
              height: design.sizes.s200,
              width: double.infinity,
              color: design.colors.primaryAppColors.xD1D2D2.withValues(
                alpha: 0.1,
              ),
            ),
          ),
        ),
        SizedBox(height: design.spacings.s16),
        Shimmer(
          child: Container(
            height: design.sizes.s30,
            width: design.sizes.s92,

            color: design.colors.primaryAppColors.xD1D2D2.withValues(
              alpha: 0.1,
            ),
          ),
        ),

        SizedBox(height: design.spacings.s16),
        Row(
          children: [
            Shimmer(
              child: Container(
                height: design.sizes.s30,
                width: design.sizes.s60,

                color: design.colors.primaryAppColors.xD1D2D2.withValues(
                  alpha: 0.1,
                ),
              ),
            ),

            SizedBox(width: design.spacings.s8),
            Shimmer(
              child: Container(
                height: design.sizes.s30,
                width: design.sizes.s60,

                color: design.colors.primaryAppColors.xD1D2D2.withValues(
                  alpha: 0.1,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: design.spacings.s16),
        Shimmer(
          child: Container(
            height: design.sizes.s30,
            width: design.sizes.s60,

            color: design.colors.primaryAppColors.xD1D2D2.withValues(
              alpha: 0.1,
            ),
          ),
        ),
        SizedBox(height: design.spacings.s8),
        Shimmer(
          child: Container(
            height: design.sizes.s100,
            width: double.infinity,

            color: design.colors.primaryAppColors.xD1D2D2.withValues(
              alpha: 0.1,
            ),
          ),
        ),
        SizedBox(height: design.spacings.s16),
      ],
    );
  }
}
