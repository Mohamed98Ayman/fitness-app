class EquipmentFilterDto {
  final String equipmentId;

  EquipmentFilterDto({required this.equipmentId});

  @override
  int get hashCode => Object.hash(equipmentId, equipmentId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is EquipmentFilterDto && other.equipmentId == equipmentId;
  }

  @override
  String toString() => 'EquipmentFilterDto(equipmentId: $equipmentId)';
}
