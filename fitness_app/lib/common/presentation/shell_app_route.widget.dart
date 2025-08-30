import 'package:fitness_app/design_system/design_systems.extension.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellAppRoute extends StatelessWidget {
  const ShellAppRoute({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final design = context.design;
    final GoRouter router = GoRouter.of(context);
    final String? location = router.state.path;
    int currentIndex = 0;
    if (location != null) {
      if (location.startsWith('/search')) {
        currentIndex = 2;
      } else if (location.startsWith('/profile')) {
        currentIndex = 2;
      }
    }

    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: design.spacings.s32,
            right: design.spacings.s16,
            left: design.spacings.s16,
          ),
          child: Container(
            height: design.sizes.s60,
            decoration: BoxDecoration(
              color: design.colors.primaryAppColors.x1B1D24,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              border: Border.all(
                width: 2.0,
                color: design.colors.primaryAppColors.xD1D2D2.withValues(
                  alpha: 0.2,
                ),
              ),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => router.go('/home'),
                  icon: Icon(
                    Icons.home,
                    size: design.sizes.s24,
                    color:
                        currentIndex == 0
                            ? design.colors.primaryAppColors.x00D6D7
                            : design.colors.primaryAppColors.x8F99A3,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sports_gymnastics,
                    size: design.sizes.s24,
                    color:
                        currentIndex == 1
                            ? design.colors.primaryAppColors.x00D6D7
                            : design.colors.primaryAppColors.x8F99A3,
                  ),
                ),
                IconButton(
                  onPressed: () => router.go('/search'),
                  icon: Icon(
                    Icons.search,
                    size: design.sizes.s24,
                    color:
                        currentIndex == 2
                            ? design.colors.primaryAppColors.x00D6D7
                            : design.colors.primaryAppColors.x8F99A3,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: design.sizes.s24,
                    color:
                        currentIndex == 3
                            ? design.colors.primaryAppColors.x00D6D7
                            : design.colors.primaryAppColors.x8F99A3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
