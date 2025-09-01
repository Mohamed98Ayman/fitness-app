import 'package:fitness_app/search/domain/models/applied_filters_state.model.dart';

extension AppliedFiltersStateExtension on AppliedFiltersState {
  AppliedFiltersState copyWith({
    String? bodyPart,
    String? target,
    String? equipment,
  }) {
    return AppliedFiltersState(
      bodyPart: bodyPart ?? this.bodyPart,
      target: target ?? this.target,
      equipment: equipment ?? this.equipment,
    );
  }

  AppliedFiltersState remove({
    bool? removeBodyPart,
    bool? removeTarget,
    bool? removeEquipment,
  }) {
    return AppliedFiltersState(
      bodyPart: removeBodyPart == true ? null : bodyPart,
      target: removeTarget == true ? null : target,
      equipment: removeEquipment == true ? null : equipment,
    );
  }

  bool get hasBodyPartFilter => bodyPart != null && bodyPart!.isNotEmpty;

  bool get hasTargetFilter => target != null && target!.isNotEmpty;

  bool get hasEquipmentFilter => equipment != null && equipment!.isNotEmpty;

  bool get hasFilter =>
      hasBodyPartFilter || hasTargetFilter || hasEquipmentFilter;
}
