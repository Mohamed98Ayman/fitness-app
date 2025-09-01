import 'dart:async';

import 'package:fitness_app/exercises/application/services/exercises.service.dart';
import 'package:fitness_app/exercises/domain/models/exercise_details.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseDetailsController = AsyncNotifierProvider.family<
  ExerciseDetailsController,
  ExerciseDetailsDto,
  String
>(() => ExerciseDetailsController());

class ExerciseDetailsController
    extends FamilyAsyncNotifier<ExerciseDetailsDto, String> {
  @override
  FutureOr<ExerciseDetailsDto> build(arg) {
    return ExercisesService.getExerciseDetials(exerciseId: arg);
  }
}
