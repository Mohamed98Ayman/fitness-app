import 'package:fitness_app/exercises/data/remote/exercises.repo.dart';
import 'package:fitness_app/exercises/domain/models/exercise_details.dto.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/network/application/services/http.service.dart';

class ExercisesService {
  const ExercisesService._();

  static Future<List<ExerciseSummaryDto>> getExercisesSummary() async =>
      await HttpClientService.sendRequest(ExerciseApis.getExercisiesSummary());

  static Future<ExerciseDetailsDto> getExerciseDetials({
    required String exerciseId,
  }) async => await HttpClientService.sendRequest(
    ExerciseApis.getExercisieDetials(exerciseId: exerciseId),
  );
}
