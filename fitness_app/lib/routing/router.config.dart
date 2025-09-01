import 'package:fitness_app/common/presentation/shell_app_route.widget.dart';
import 'package:fitness_app/exercises/presentation/view/widgets/exercise_details/exercise_details.screen.dart';
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
    initialLocation: '/',

    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ShellAppRoute(child: child);
        },
        routes: [
          GoRoute(
            path: '/',

            pageBuilder:
                (context, state) => NoTransitionPage(child: HomeScreen()),
          ),
          GoRoute(
            path: '/search',

            pageBuilder:
                (context, state) => NoTransitionPage(child: SearchScreen()),
            routes: [
              GoRoute(
                name: 'exercise_details',
                path: 'exercise-details',
                parentNavigatorKey: _rootNavigatorKey,
                pageBuilder: (context, state) {
                  if (state.extra is String && state.extra != null) {
                    final exerciseId = state.extra! as String;
                    return MaterialPage(
                      key: state.pageKey,
                      child: ExerciseDetailsScreen(exerciseId: exerciseId),
                    );
                  }
                  return const NoTransitionPage(child: HomeScreen());
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        pageBuilder: (context, state) => NoTransitionPage(child: HomeScreen()),
      ),
    ],
  );
}
