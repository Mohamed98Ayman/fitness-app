import 'package:fitness_app/common/presentation/view/widgets/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/exercises/presentation/controllers/search_term.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/all_exercises.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/search_bar.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/searched_exercises.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(exerciseSearchTermController);
    final design = context.design;
    final mediaQuery = MediaQuery.of(context).size;
    return AppScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leadingWidth: mediaQuery.width - design.sizes.s32,
        toolbarHeight: design.sizes.s92,
        leading: Padding(
          padding: EdgeInsets.all(design.spacings.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Exercises',
                style: design.typography.s24w600xs24w600.copyWith(
                  color: design.colors.primaryAppColors.xF5F5F5,
                ),
              ),
            ],
          ),
        ),

        backgroundColor: Colors.transparent,
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      backgroundColor: const Color(0xFF11121A),
      body: Padding(
        padding: EdgeInsets.only(
          top: design.spacings.s130,
          left: design.spacings.s16,
          right: design.spacings.s16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SearchSearchingBar(),
            SizedBox(height: design.spacings.s12),
            if (searchTextController.text.isEmpty) ...[
              SearchAllExercises(),
            ] else ...[
              SearchExercise(),
            ],
          ],
        ),
      ),
    );
  }
}
