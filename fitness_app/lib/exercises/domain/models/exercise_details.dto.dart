class ExerciseDetailsDto {
  final String id;
  final String name;
  final String description;
  final String difficulty;
  final String category;
  final String bodyPart;
  final String equipment;
  final String target;
  final List<String> secondaryMuscles;
  final List<String> instructions;

  ExerciseDetailsDto({
    required this.id,
    required this.name,
    required this.description,
    required this.difficulty,
    required this.category,
    required this.bodyPart,
    required this.equipment,
    required this.target,
    required this.secondaryMuscles,
    required this.instructions,
  });

  factory ExerciseDetailsDto.fromJson(Map<String, dynamic> data) {
    return ExerciseDetailsDto(
      id: data['id'],
      name: data['name'],
      description: data['description'],
      difficulty: data['difficulty'],
      category: data['category'],
      bodyPart: data['bodyPart'],
      equipment: data['equipment'],
      target: data['target'],
      secondaryMuscles: List<String>.from(data['secondaryMuscles'] ?? []),
      instructions: List<String>.from(data['instructions'] ?? []),
    );
  }

  @override
  int get hashCode => Object.hashAllUnordered([
    id,
    name,
    description,
    difficulty,
    category,
    bodyPart,
    equipment,
    target,
    Object.hashAllUnordered(secondaryMuscles),
    Object.hashAllUnordered(instructions),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (runtimeType != other.runtimeType) return false;
    return other is ExerciseDetailsDto && hashCode == other.hashCode;
  }

  @override
  String toString() =>
      'ExerciseDetailsDto(id: $id, name: $name, description: $description, difficulty: $difficulty, category: $category, bodyPart: $bodyPart, equipment: $equipment, target: $target, secondaryMuscles: $secondaryMuscles, instructions: $instructions)';
}
