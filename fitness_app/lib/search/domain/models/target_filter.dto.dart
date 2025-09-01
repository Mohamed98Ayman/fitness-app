class TargetFilterDto {
  final String targetId;

  TargetFilterDto({required this.targetId});

  @override
  int get hashCode => Object.hash(targetId, targetId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is TargetFilterDto && other.targetId == targetId;
  }

  @override
  String toString() => 'TargetFilterDto(targetId: $targetId)';
}
