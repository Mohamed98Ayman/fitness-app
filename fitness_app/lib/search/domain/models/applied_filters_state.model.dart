class AppliedFiltersState {
  final String? bodyPart;
  final String? target;
  final String? equipment;

  AppliedFiltersState({this.bodyPart, this.target, this.equipment});

  @override
  int get hashCode => Object.hashAllUnordered([bodyPart, target, equipment]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is AppliedFiltersState && hashCode == other.hashCode;
  }
}
