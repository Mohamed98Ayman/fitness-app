import 'dart:async';

import 'package:fitness_app/exercises/application/services/exercises.service.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSearchController = AsyncNotifierProvider.family<
  ExerciseSummaryController,
  List<ExerciseSummary>,
  String
>(() => ExerciseSummaryController());

class ExerciseSummaryController
    extends FamilyAsyncNotifier<List<ExerciseSummary>, String> {
  @override
  FutureOr<List<ExerciseSummary>> build(String arg) {
    return ExercisesService.getExerciseSearch(searchTerm: arg);
  }
}
