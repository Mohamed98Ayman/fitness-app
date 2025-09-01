import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';

extension ExercisesSummaryHelpers on List<ExerciseSummaryDto> {
  List<String> getExercisesNames() => map((e) => e.name).toList();
}
