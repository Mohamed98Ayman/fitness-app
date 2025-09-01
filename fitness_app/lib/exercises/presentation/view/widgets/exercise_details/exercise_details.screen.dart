import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common/presentation/view/widgets/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/controllers/exercise_details.controller.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_category_card.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_details_loading.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_instructions.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_secondary_muscle.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_tag.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ExerciseDetailsScreen extends ConsumerWidget {
  const ExerciseDetailsScreen({super.key, required this.exerciseId});
  final String exerciseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseDetailsAsync = ref.watch(
      exerciseDetailsController(exerciseId),
    );
    final design = context.design;
    final mediaQuery = MediaQuery.of(context).size;
    return AppScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leadingWidth: mediaQuery.width - design.sizes.s32,
        toolbarHeight: design.sizes.s92,
        leading: Padding(
          padding: EdgeInsets.all(design.spacings.s16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: design.colors.primaryAppColors.xF5F5F5,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: design.sizes.s4),
                  child: Text(
                    "Exercise Details",
                    overflow: TextOverflow.ellipsis,
                    style: design.typography.s24w600xs24w600.copyWith(
                      color: design.colors.primaryAppColors.xF5F5F5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        backgroundColor: Colors.transparent,
      ),
      backgroundColor: design.colors.primaryAppColors.x11121A,

      body: Padding(
        padding: EdgeInsets.only(
          top: design.spacings.s130,
          left: design.spacings.s16,
          right: design.spacings.s16,
        ),

        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: exerciseDetailsAsync.when(
            data:
                (exerciseDetails) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: design.sizes.s200,
                        width: double.infinity,
                        color: design.colors.primaryAppColors.xFFFFFF,

                        child: CachedNetworkImage(
                          imageUrl:
                              'https://exercisedb.p.rapidapi.com/image?resolution=360&exerciseId=$exerciseId',
                          httpHeaders: {
                            'X-RapidAPI-Key':
                                dotenv.env['X_RAPID_API_KEY'] ?? "",
                          },
                          fit: BoxFit.fitHeight,
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
                    ),
                    SizedBox(height: design.spacings.s16),
                    Text(
                      exerciseDetails.name,
                      maxLines: 2,
                      style: design.typography.s24w700xs24w700.copyWith(
                        color: design.colors.primaryAppColors.xFFFFFF,
                      ),
                    ),
                    SizedBox(height: design.spacings.s16),
                    Row(
                      children: [
                        ExerciseTag(
                          title: exerciseDetails.category,
                          color: design.colors.primaryAppColors.x00D6D7,
                        ),
                        SizedBox(width: design.spacings.s8),
                        ExerciseTag(
                          title: exerciseDetails.difficulty,
                          color: design.colors.primaryAppColors.x2C7CEE,
                        ),
                      ],
                    ),
                    SizedBox(height: design.spacings.s16),
                    Text(
                      "description",
                      maxLines: 2,
                      style: design.typography.s18w700xs18w700.copyWith(
                        color: design.colors.primaryAppColors.xFFFFFF,
                      ),
                    ),
                    SizedBox(height: design.spacings.s8),
                    Text(
                      exerciseDetails.description,
                      style: design.typography.s16w500xs16w500.copyWith(
                        color: design.colors.primaryAppColors.xD1D2D2,
                      ),
                    ),
                    SizedBox(height: design.spacings.s16),
                    Row(
                      children: [
                        Expanded(
                          child: ExerciseCategory(
                            title: "Equipment",
                            subTitle: exerciseDetails.equipment,
                          ),
                        ),
                        SizedBox(width: design.sizes.s16),
                        Expanded(
                          child: ExerciseCategory(
                            title: "Target",
                            subTitle: exerciseDetails.target,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: design.spacings.s16),
                    Row(
                      children: [
                        Expanded(
                          child: ExerciseCategory(
                            title: "Body Part",
                            subTitle: exerciseDetails.bodyPart,
                          ),
                        ),
                        SizedBox(width: design.sizes.s16),
                        Expanded(
                          child: ExerciseCategory(
                            title: "Difficulty",
                            subTitle: exerciseDetails.difficulty,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: design.sizes.s16),
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
                            (context, index) => ExerciseSecondaryMuscle(
                              title: exerciseDetails.secondaryMuscles[index],
                            ),
                        separatorBuilder:
                            (context, index) =>
                                SizedBox(width: design.spacings.s4),
                        itemCount: exerciseDetails.secondaryMuscles.length,
                      ),
                    ),
                    SizedBox(height: design.sizes.s16),
                    Text(
                      "Instructions",
                      style: design.typography.s18w700xs18w700.copyWith(
                        color: design.colors.primaryAppColors.xFFFFFF,
                      ),
                    ),

                    SizedBox(height: design.sizes.s16),
                    ExerciseInstructions(
                      instructions: exerciseDetails.instructions,
                    ),
                    SizedBox(height: design.sizes.s40),
                  ],
                ),
            error: (error, stackTrace) => SizedBox.shrink(),
            loading: () => ExerciseDetailsLoading(),
          ),
        ),
      ),
    );
  }
}
