import 'package:fitness_app/common/presentation/view/widgets/scaffold/app_scaffold.widget.dart';
import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    final mediaQuery = MediaQuery.of(context).size;
    return AppScaffold(
      backgroundColor: design.colors.primaryAppColors.x11121A,
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(design.spacings.s16),
              child: Text(
                'Home Screen',
                style: TextStyle(color: design.colors.primaryAppColors.xFFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
