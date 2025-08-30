import 'dart:async';

import 'package:fitness_app/exercises/application/services/exercises.service.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSummaryController =
    AsyncNotifierProvider<ExerciseSummaryController, List<ExerciseSummary>>(
      () => ExerciseSummaryController(),
    );

class ExerciseSummaryController extends AsyncNotifier<List<ExerciseSummary>> {
  @override
  FutureOr<List<ExerciseSummary>> build() {
    return ExercisesService.getExercisesSummary();
  }
}
