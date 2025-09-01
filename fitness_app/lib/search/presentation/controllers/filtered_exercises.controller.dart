import 'dart:async';

import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/search/application/services/search.service.dart';
import 'package:fitness_app/search/domain/models/applied_filters_state.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filteredExercisesController = AsyncNotifierProvider.family<
  FilteredExercisesController,
  List<ExerciseSummaryDto>,
  AppliedFiltersState
>(() => FilteredExercisesController());

class FilteredExercisesController
    extends FamilyAsyncNotifier<List<ExerciseSummaryDto>, AppliedFiltersState> {
  @override
  FutureOr<List<ExerciseSummaryDto>> build(arg) {
    return SearchService.getFilteredExercises(appliedFiltersState: arg);
  }
}
