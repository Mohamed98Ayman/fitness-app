import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/application/extensions/applied_filters_state.extension.model.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/buttons/body_part_filter_button.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/buttons/equipment_filter_button.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/buttons/reset_filters_button.widget.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/buttons/target_filter_button.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FiltersBar extends ConsumerWidget {
  const FiltersBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFilterApplied = ref.watch(appliedFiltersController).hasFilter;
    final design = context.design;
    return SizedBox(
      height: design.sizes.s36,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isFilterApplied) ...{
              ResetFilterButton(),
              SizedBox(width: design.spacings.s6),
            },
            TargetFilterButton(),
            SizedBox(width: design.spacings.s6),
            EquipmentFilterButton(),
            SizedBox(width: design.spacings.s6),
            BodyPartFilterButton(),
            SizedBox(width: design.spacings.s6),
          ],
        ),
      ),
    );
  }
}
