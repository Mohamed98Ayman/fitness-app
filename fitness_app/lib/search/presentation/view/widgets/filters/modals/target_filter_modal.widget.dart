import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/controllers/target_list.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/modals/filter_modal_loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TargetFilterModal extends ConsumerWidget {
  const TargetFilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetAsync = ref.watch(targetController);
    final design = context.design;
    return SizedBox(
      height: design.sizes.s400,
      child: targetAsync.when(
        data:
            (targets) => ListView.builder(
              itemCount: targets.length,
              itemBuilder: (context, index) {
                final target = targets[index];
                return ListTile(
                  title: Text(
                    target.targetId,
                    style: design.typography.s16w400xs16w400.copyWith(
                      color: design.colors.primaryAppColors.xFFFFFF,
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(appliedFiltersController.notifier)
                        .selectTargetFilter(selectedTarget: target.targetId);
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
