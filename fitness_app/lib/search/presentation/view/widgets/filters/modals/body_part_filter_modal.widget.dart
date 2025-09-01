import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:fitness_app/search/presentation/controllers/applied_filters.controller.dart';
import 'package:fitness_app/search/presentation/controllers/body_part_list.controller.dart';
import 'package:fitness_app/search/presentation/view/widgets/filters/modals/filter_modal_loading.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BodyPartFilterModal extends ConsumerWidget {
  const BodyPartFilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodyPartAsync = ref.watch(bodyPartController);
    final design = context.design;
    return SizedBox(
      height: design.sizes.s400,
      child: bodyPartAsync.when(
        data:
            (bodyParts) => ListView.builder(
              itemCount: bodyParts.length,
              itemBuilder: (context, index) {
                final bodyPart = bodyParts[index];
                return ListTile(
                  title: Text(
                    bodyPart.bodyPartId,
                    style: design.typography.s16w400xs16w400.copyWith(
                      color: design.colors.primaryAppColors.xFFFFFF,
                    ),
                  ),
                  onTap: () {
                    ref
                        .read(appliedFiltersController.notifier)
                        .selectBodyPartFilter(
                          selectedBodyPart: bodyPart.bodyPartId,
                        );
                    Navigator.pop(context, bodyPart);
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
