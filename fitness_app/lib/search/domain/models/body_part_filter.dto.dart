class BodyPartDto {
  final String bodyPartId;

  BodyPartDto({required this.bodyPartId});

  @override
  int get hashCode => Object.hash(bodyPartId, bodyPartId);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is BodyPartDto && other.bodyPartId == bodyPartId;
  }

  @override
  String toString() => 'BodyPartDto(bodyPartId: $bodyPartId)';
}
