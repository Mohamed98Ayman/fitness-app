import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/network/domain/enums/request_method.enum.dart';
import 'package:fitness_app/network/domain/models/endpoint_signature.model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExerciseApis {
  const ExerciseApis._();

  static const String _basePathParam = '/exercises';

  static EndpointSignature getExercisiesSummary() => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: _basePathParam,
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((exerciseSummary) => ExerciseSummary.fromJson(exerciseSummary))
            .toList();
      }
      return List<ExerciseSummary>.empty();
    },
  );
}
