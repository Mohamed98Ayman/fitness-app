import 'package:fitness_app/exercises/data/remote/exercises.repo.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/network/application/services/http.service.dart';

class ExercisesService {
  const ExercisesService._();

  static Future<List<ExerciseSummary>> getExercisesSummary() async =>
      await HttpClientService.sendRequest(ExerciseApis.getExercisiesSummary());
}
