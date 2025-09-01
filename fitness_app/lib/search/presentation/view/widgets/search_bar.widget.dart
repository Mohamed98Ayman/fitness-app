import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/controllers/search_term.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchSearchingBar extends ConsumerWidget {
  const SearchSearchingBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchTextController = ref.watch(exerciseSearchTermController);
    final focusNode = FocusNode();
    final design = context.design;
    return Container(
      decoration: BoxDecoration(
        color: design.colors.primaryAppColors.x22242C,
        borderRadius: BorderRadius.circular(design.sizes.s16),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: design.spacings.s16),
        child: Row(
          children: [
            Icon(Icons.search, color: design.colors.primaryAppColors.xF5F5F5),
            SizedBox(width: design.spacings.s8),
            Expanded(
              child: TextField(
                controller: searchTextController,
                focusNode: focusNode,

                onChanged: (value) {
                  ref
                      .read(exerciseSearchTermController.notifier)
                      .updateText(value);
                  ref.read(appliedFiltersController.notifier).resetFilters();
                },
                style: design.typography.s16w400xs16w400.copyWith(
                  color: design.colors.primaryAppColors.xF5F5F5,
                ),
                decoration: InputDecoration(
                  hintText: 'Search exercises',
                  hintStyle: design.typography.s16w400xs16w400.copyWith(
                    color: design.colors.primaryAppColors.xF5F5F5.withValues(
                      alpha: 0.7,
                    ),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
