class ExerciseSummaryThumbnail {
  final String id;
  final String resolution;

  ExerciseSummaryThumbnail({required this.id, this.resolution = '720'});

  @override
  int get hashCode => Object.hashAllUnordered([id, resolution]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is ExerciseSummaryThumbnail && hashCode == other.hashCode;
  }

  @override
  String toString() =>
      'ExerciseSummaryThumbnail(id: $id, resolution: $resolution)';
}
