import 'dart:async';

import 'package:fitness_app/exercises/application/services/exercises.service.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSummaryController =
    AsyncNotifierProvider<ExerciseSummaryController, List<ExerciseSummaryDto>>(
      () => ExerciseSummaryController(),
    );

class ExerciseSummaryController
    extends AsyncNotifier<List<ExerciseSummaryDto>> {
  @override
  FutureOr<List<ExerciseSummaryDto>> build() {
    return ExercisesService.getExercisesSummary();
  }
}
