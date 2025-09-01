import 'dart:async';

import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/search/application/services/search.service.dart';
import 'package:fitness_app/search/domain/models/applied_filters_state.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredExercisesController = AsyncNotifierProvider.family<
  FilteredExercisesController,
  List<ExerciseSummary>,
  AppliedFiltersState
>(() => FilteredExercisesController());

class FilteredExercisesController
    extends FamilyAsyncNotifier<List<ExerciseSummary>, AppliedFiltersState> {
  @override
  FutureOr<List<ExerciseSummary>> build(arg) {
    return SearchService.getFilteredExercises(appliedFiltersState: arg);
  }
}
