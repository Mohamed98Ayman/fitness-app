import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/controllers/equipment_list.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/modals/filter_modal_loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EquipmentFilterModal extends ConsumerWidget {
  const EquipmentFilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final equipmentAsync = ref.watch(equipmentController);
    final design = context.design;
    return SizedBox(
      height: design.sizes.s400,
      child: equipmentAsync.when(
        data:
            (equipments) => ListView.builder(
              itemCount: equipments.length,
              itemBuilder: (context, index) {
                final equipment = equipments[index];
                return ListTile(
                  title: Text(
                    equipment.equipmentId,
                    style: design.typography.s16w400xs16w400.copyWith(
                      color: design.colors.primaryAppColors.xFFFFFF,
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(appliedFiltersController.notifier)
                        .selectEquipmentFilter(
                          selectedEquipment: equipment.equipmentId,
                        );
                    Navigator.pop(context);
                  },
                );
              },
            ),
        loading: () => FilterModalLoading(),
        error:
            (error, stack) => Center(
              child: Text(
                'Something went wrong',
                style: design.typography.s16w400xs16w400.copyWith(
                  color: design.colors.primaryAppColors.x11121A,
                ),
              ),
            ),
      ),
    );
  }
}
