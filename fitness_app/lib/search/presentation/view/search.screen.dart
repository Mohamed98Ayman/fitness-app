import 'package:fitness_app/common/presentation/view/widgets/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/controllers/exercise_summary.controller.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_summary_card/exercise_summary_card.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exerciseSummaryAsync = ref.watch(exerciseSummaryController);

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exercises',
                style: design.typography.s24w600xs24w600.copyWith(
                  color: design.colors.primaryAppColors.xF5F5F5,
                ),
              ),
            ],
          ),
        ),

        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFF11121A),
      body: Padding(
        padding: EdgeInsets.only(
          top: design.spacings.s130,
          left: design.spacings.s16,
          right: design.spacings.s16,
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: design.colors.primaryAppColors.x22242C,
                borderRadius: BorderRadius.circular(design.sizes.s16),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: design.spacings.s16),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: design.colors.primaryAppColors.xF5F5F5,
                    ),
                    SizedBox(width: design.spacings.s8),
                    Expanded(
                      child: TextField(
                        style: design.typography.s16w400xs16w400.copyWith(
                          color: design.colors.primaryAppColors.xF5F5F5,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search exercises',
                          hintStyle: design.typography.s16w400xs16w400.copyWith(
                            color: design.colors.primaryAppColors.xF5F5F5
                                .withValues(alpha: 0.7),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: design.spacings.s12),
            exerciseSummaryAsync.when(
              data: (data) {
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      SizedBox(height: design.spacings.s12),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        separatorBuilder:
                            (context, index) =>
                                SizedBox(height: design.spacings.s16),
                        itemCount: data.length,

                        itemBuilder: (context, index) {
                          final currentExerciseCard = data[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: design.colors.primaryAppColors.x1A1F28
                                  .withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ExerciseSummaryCard(
                              exerciseTitle: currentExerciseCard.name,
                              exerciseCategory: currentExerciseCard.category,
                              exerciseDefficulty:
                                  currentExerciseCard.difficulty,
                              exerciseId: currentExerciseCard.id,
                            ),
                          );
                        },
                        shrinkWrap: true,
                      ),
                      SizedBox(height: design.spacings.s100),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) => SizedBox.shrink(),
              loading: () => SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
