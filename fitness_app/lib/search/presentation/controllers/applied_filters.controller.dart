import 'package:fitness_app/search/application/extensions/applied_filters_state.extension.model.dart';
import 'package:fitness_app/search/domain/models/applied_filters_state.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appliedFiltersController =
    NotifierProvider<AppliedFiltersController, AppliedFiltersState>(
      () => AppliedFiltersController(),
    );

class AppliedFiltersController extends Notifier<AppliedFiltersState> {
  @override
  AppliedFiltersState build() {
    return AppliedFiltersState();
  }

  selectBodyPartFilter({required String selectedBodyPart}) {
    state = state
        .copyWith(bodyPart: selectedBodyPart)
        .remove(removeTarget: true, removeEquipment: true);
  }

  selectTargetFilter({required String selectedTarget}) {
    state = state
        .copyWith(target: selectedTarget)
        .remove(removeBodyPart: true, removeEquipment: true);
  }

  selectEquipmentFilter({required String selectedEquipment}) {
    state = state
        .copyWith(equipment: selectedEquipment)
        .remove(removeBodyPart: true, removeTarget: true);
  }

  resetFilters() => state = AppliedFiltersState();
}
