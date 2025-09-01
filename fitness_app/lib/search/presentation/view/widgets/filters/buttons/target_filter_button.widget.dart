import 'package:fitness_app/common/application/extensions/modal.extension.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/application/extensions/applied_filters_state.extension.model.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/filter_button.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/modals/target_filter_modal.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TargetFilterButton extends ConsumerWidget {
  const TargetFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTargetSelected =
        ref.watch(appliedFiltersController).hasTargetFilter;
    final design = context.design;
    return FilterButton(
      title: "Target",
      isSelected: isTargetSelected,
      onPressed:
          () => context.showBottomModalSheet(
            TargetFilterModal(),
            backgroundColor: design.colors.primaryAppColors.x11121A,
          ),
    );
  }
}
