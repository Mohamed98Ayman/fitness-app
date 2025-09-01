import 'package:fitness_app/exercises/data/remote/exercises.repo.dart';
import 'package:fitness_app/exercises/domain/models/exercise_summary.dto.dart';
import 'package:fitness_app/network/application/services/http.service.dart';
import 'package:fitness_app/search/application/extensions/applied_filters_state.extension.model.dart';
import 'package:fitness_app/search/data/remote/search.repo.dart';
import 'package:fitness_app/search/domain/models/applied_filters_state.model.dart';

class SearchService {
  const SearchService._();

  static Future<List<ExerciseSummaryDto>> getExercisesSummary() async =>
      await HttpClientService.sendRequest(ExerciseApis.getExercisiesSummary());

  static Future<List<ExerciseSummaryDto>> getExerciseSearch({
    required String searchTerm,
  }) async => await HttpClientService.sendRequest(
    SearchApis.getExerciseSearch(searchTerm: searchTerm),
  );

  static Future<List<ExerciseSummaryDto>> getFilteredExercises({
    required AppliedFiltersState appliedFiltersState,
  }) async {
    if (appliedFiltersState.hasBodyPartFilter) {
      return await HttpClientService.sendRequest(
        SearchApis.getFilteredExercisesByBodyPart(
          bodyPart: appliedFiltersState.bodyPart!,
        ),
      );
    } else if (appliedFiltersState.hasEquipmentFilter) {
      return await HttpClientService.sendRequest(
        SearchApis.getFilteredExercisesByEquipment(
          equipment: appliedFiltersState.equipment!,
        ),
      );
    } else if (appliedFiltersState.hasTargetFilter) {
      return await HttpClientService.sendRequest(
        SearchApis.getFilteredExercisesByTarget(
          target: appliedFiltersState.target!,
        ),
      );
    }
    return List<ExerciseSummaryDto>.empty();
  }
}
