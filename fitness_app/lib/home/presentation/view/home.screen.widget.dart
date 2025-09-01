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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: design.spacings.s16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      design.colors.primaryAppColors.x139A95,
                      design.colors.primaryAppColors.x0E3556,
                    ],
                    begin: AlignmentDirectional.topEnd,
                    end: AlignmentDirectional.topStart,
                  ),
                ),
                padding: EdgeInsets.all(design.spacings.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to A-Fitness!',
                      style: design.typography.s18w600xs18w600.copyWith(
                        color: design.colors.primaryAppColors.xFFFFFF,
                      ),
                    ),
                    SizedBox(height: design.spacings.s16),
                    Text(
                      'A-Fitness is your ultimate fitness companion. Whether you\'re just starting or pushing towards your next goal, A-Fitness provides all the exercises and instructions you need to train effectively.',
                      style: design.typography.s14w500xs14w500.copyWith(
                        color: design.colors.primaryAppColors.xFFFFFF,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
