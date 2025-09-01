import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/search/application/services/search.service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSearchController =
    FutureProvider.family<List<ExerciseSummary>, String>(
      (ref, arg) => SearchService.getExerciseSearch(searchTerm: arg),
    );
