import 'package:fitness_app/common/presentation/view/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    final mediaQuery = MediaQuery.of(context).size;
    return AppScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leadingWidth: mediaQuery.width - design.sizes.s32,
        toolbarHeight: design.sizes.s92,
        leading: Padding(
          padding: EdgeInsets.all(design.spacings.s16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: design.typography.s14w600xs14w600.copyWith(
                  color: design.colors.primaryAppColors.xF5F5F5,
                ),
              ),
              Text(
                'Ayman',
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
      body: Container(
        color: design.colors.primaryAppColors.x1D1D1D,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: [0.1, 0.3, 1],
              colors: [
                design.colors.primaryAppColors.x0A0708.withValues(alpha: 0.5),
                design.colors.primaryAppColors.x0A0708.withValues(alpha: 0.5),
                design.colors.primaryAppColors.xFFFFFF.withValues(alpha: 0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const Center(child: Text('')),
        ),
      ),
    );
  }
}
