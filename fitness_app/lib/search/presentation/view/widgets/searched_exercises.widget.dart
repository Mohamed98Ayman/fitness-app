import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/controllers/exercises_search.controller.dart';
import 'package:fitness_app/exercises/presentation/controllers/search_term.controller.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_summary_card/exercise_summary_card.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/exercises_cards_empty.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/exercises_cards_error.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/exercises_cards_loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchExercise extends ConsumerWidget {
  const SearchExercise({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(exerciseSearchTermController);
    final exerciseSearchAsync = ref.watch(
      exerciseSearchController(searchTextController.text),
    );
    final design = context.design;
    return exerciseSearchAsync.when(
      data: (data) {
        if (data.isEmpty) {
          return ExercisesCardsEmpty();
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: design.spacings.s12),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                separatorBuilder:
                    (context, index) => SizedBox(height: design.spacings.s16),
                itemCount: data.length,

                itemBuilder: (context, index) {
                  final currentExerciseCard = data[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: design.colors.primaryAppColors.x1A1F28.withValues(
                        alpha: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExerciseSummaryCard(
                      exerciseTitle: currentExerciseCard.name,
                      exerciseCategory: currentExerciseCard.category,
                      exerciseDefficulty: currentExerciseCard.difficulty,
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
      error: (error, stackTrace) => ExercisesCardsError(),
      loading: () => ExercisesCardsLoading(),
    );
  }
}
