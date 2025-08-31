import 'package:fitness_app/common/presentation/shell_app_route.widget.dart';
import 'package:fitness_app/home/presentation/view/home.screen.widget.dart';
import 'package:fitness_app/search/presentation/view/search.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FitnessRouterConfig {
  static const FitnessRouterConfig _instance = FitnessRouterConfig._();
  factory FitnessRouterConfig() => _instance;
  const FitnessRouterConfig._();

  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ShellAppRoute(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',

            pageBuilder:
                (context, state) => NoTransitionPage(child: HomeScreen()),

            routes: [
              GoRoute(
                path: 'details',
                pageBuilder:
                    (context, state) => NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          GoRoute(
            path: '/search',
            pageBuilder:
                (context, state) => NoTransitionPage(child: SearchScreen()),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder:
                (context, state) => NoTransitionPage(child: HomeScreen()),
          ),
        ],
      ),
    ],
  );
}
