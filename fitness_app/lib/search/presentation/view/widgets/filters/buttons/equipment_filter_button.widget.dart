import 'package:fitness_app/common/application/extensions/modal.extension.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/application/extensions/applied_filters_state.extension.model.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/filter_button.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/modals/equipment_filter_modal.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentFilterButton extends ConsumerWidget {
  const EquipmentFilterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEquipmentSelected =
        ref.watch(appliedFiltersController).hasEquipmentFilter;
    final design = context.design;
    return FilterButton(
      title: "Equipment",
      isSelected: isEquipmentSelected,
      onPressed:
          () => context.showBottomModalSheet(
            EquipmentFilterModal(),
            backgroundColor: design.colors.primaryAppColors.x11121A,
          ),
    );
  }
}
