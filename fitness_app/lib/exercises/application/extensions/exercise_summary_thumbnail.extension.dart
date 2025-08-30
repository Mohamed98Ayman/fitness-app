import 'package:fitness_app/exercises/domain/models/exercise_summary_thumbnail.model.dart';

extension ExerciseSummaryThumbnailHelpers on ExerciseSummaryThumbnail {
  Map<String, String> toQueryParams() {
    return {'exerciseId': id, 'resolution': resolution};
  }
}
