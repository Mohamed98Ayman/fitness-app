import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exerciseSearchTermController =
    NotifierProvider<ExerciseSearchTermController, TextEditingController>(
      () => ExerciseSearchTermController(),
    );

class ExerciseSearchTermController extends Notifier<TextEditingController> {
  @override
  TextEditingController build() {
    return TextEditingController();
  }

  updateText(String newText) {
    state = TextEditingController(text: newText);
    state.selection = TextSelection.fromPosition(
      TextPosition(offset: state.text.length),
    );
  }
}
