import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/common/presentation/view/widgets/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/controllers/exercise_details.controller.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/category/exercise_categories.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/description/exercise_description.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/exercise_details_loading.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/instructions/exercise_instructions.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/secondary_muscle/exercise_secondary_muscles.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/tags/exercise_tags.widget.dart';
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
                    ExerciseTags(
                      category: exerciseDetails.category,
                      difficulty: exerciseDetails.difficulty,
                    ),
                    SizedBox(height: design.spacings.s16),
                    ExerciseDescription(
                      description: exerciseDetails.description,
                    ),
                    SizedBox(height: design.spacings.s16),
                    ExerciseCategories(
                      bodyPart: exerciseDetails.bodyPart,
                      difficulty: exerciseDetails.difficulty,
                      equipment: exerciseDetails.equipment,
                      target: exerciseDetails.target,
                    ),
                    SizedBox(height: design.sizes.s16),
                    ExerciseExerciseMuscles(
                      secondaryMuscles: exerciseDetails.secondaryMuscles,
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
