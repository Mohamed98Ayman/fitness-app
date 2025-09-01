import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/network/domain/enums/request_method.enum.dart';
import 'package:fitness_app/network/domain/models/endpoint_signature.model.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class SearchApis {
  const SearchApis._();

  static const String _basePathParam = '/exercises';

  static EndpointSignature getExerciseSearch({
    required String searchTerm,
  }) => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/name/$searchTerm',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((exerciseSummary) => ExerciseSummary.fromJson(exerciseSummary))
            .toList();
      }
      return List<ExerciseSummary>.empty();
    },
  );

  static EndpointSignature getFilteredExercisesByBodyPart({
    required String bodyPart,
  }) => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/bodyPart/$bodyPart',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((exerciseSummary) => ExerciseSummary.fromJson(exerciseSummary))
            .toList();
      }
      return List<ExerciseSummary>.empty();
    },
  );

  static EndpointSignature getFilteredExercisesByEquipment({
    required String equipment,
  }) => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/equipment/$equipment',
    responseBuilder: (data) {
      if (data is List && data.isNotEmpty) {
        return data
            .map((exerciseSummary) => ExerciseSummary.fromJson(exerciseSummary))
            .toList();
      }
      return List<ExerciseSummary>.empty();
    },
  );

  static EndpointSignature getFilteredExercisesByTarget({
    required String target,
  }) => EndpointSignature(
    baseUrl: dotenv.env['EXERCISES_DB_URL'],
    requestMethod: HttpRequestMethod.get,
    path: '$_basePathParam/target/$target',
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
