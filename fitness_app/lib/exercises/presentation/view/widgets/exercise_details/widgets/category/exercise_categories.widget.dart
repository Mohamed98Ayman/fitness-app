import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/widgets/category/exercise_category_card.widget.dart';
import 'package:flutter/widgets.dart';

class ExerciseCategories extends StatelessWidget {
  const ExerciseCategories({
    super.key,
    required this.equipment,
    required this.target,
    required this.bodyPart,
    required this.difficulty,
  });
  final String equipment;
  final String target;
  final String bodyPart;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ExerciseCategory(title: "Equipment", subTitle: equipment),
            ),
            SizedBox(width: design.sizes.s16),
            Expanded(
              child: ExerciseCategory(title: "Target", subTitle: target),
            ),
          ],
        ),
        SizedBox(height: design.spacings.s16),
        Row(
          children: [
            Expanded(
              child: ExerciseCategory(title: "Body Part", subTitle: bodyPart),
            ),
            SizedBox(width: design.sizes.s16),
            Expanded(
              child: ExerciseCategory(
                title: "Difficulty",
                subTitle: difficulty,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
