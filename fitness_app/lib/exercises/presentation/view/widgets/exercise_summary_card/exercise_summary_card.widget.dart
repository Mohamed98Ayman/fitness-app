import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_tag.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ExerciseSummaryCard extends ConsumerWidget {
  const ExerciseSummaryCard({
    super.key,
    required this.exerciseTitle,
    required this.exerciseCategory,
    required this.exerciseDefficulty,
    required this.exerciseId,
  });
  final String exerciseTitle;
  final String exerciseCategory;
  final String exerciseDefficulty;
  final String exerciseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = GoRouter.of(context);
    final design = context.design;
    return GestureDetector(
      onTap: () => router.pushNamed("exercise_details", extra: exerciseId),
      child: Container(
        decoration: BoxDecoration(
          color: design.colors.primaryAppColors.x22242C,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(design.spacings.s16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://exercisedb.p.rapidapi.com/image?resolution=360&exerciseId=$exerciseId',
                  httpHeaders: {
                    'X-RapidAPI-Key': dotenv.env['X_RAPID_API_KEY'] ?? "",
                  },

                  height: design.sizes.s100,
                  width: design.sizes.s100,
                  placeholder:
                      (context, url) => Shimmer(
                        child: Container(
                          height: design.sizes.s100,
                          width: design.sizes.s100,
                          color: design.colors.primaryAppColors.xD1D2D2
                              .withValues(alpha: 0.1),
                        ),
                      ),
                ),
              ),
              SizedBox(width: design.spacings.s16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exerciseTitle,
                      overflow: TextOverflow.ellipsis,
                      style: design.typography.s20w600xs20w600.copyWith(
                        color: design.colors.primaryAppColors.xD1D2D2,
                      ),
                    ),
                    SizedBox(height: design.sizes.s8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ExerciseTag(
                          title: exerciseCategory,
                          color: design.colors.primaryAppColors.x1A2C43,
                        ),
                        SizedBox(width: design.spacings.s8),
                        ExerciseTag(
                          title: exerciseDefficulty,
                          color: design.colors.primaryAppColors.x1A2C43,
                        ),
                      ],
                    ),
                    SizedBox(height: design.sizes.s4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
