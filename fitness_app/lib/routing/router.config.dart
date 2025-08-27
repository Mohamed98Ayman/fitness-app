// region Imports

import 'package:fitness_app/common/presentation/shell_app_route.widget.dart';
import 'package:fitness_app/home/presentation/view/home.screen.widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// endregion

class FitnessRouterConfig {
  static const FitnessRouterConfig _instance = FitnessRouterConfig._();
  factory FitnessRouterConfig() => _instance;
  const FitnessRouterConfig._();

  // ------------------------------ ROUTER CONFIGURATION ------------------------------

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
            builder: (context, state) => HomeScreen(),

            routes: [
              GoRoute(
                path: 'details',
                builder: (context, state) => HomeScreen(),
              ),
            ],
          ),
          GoRoute(path: '/search', builder: (context, state) => HomeScreen()),
          GoRoute(path: '/profile', builder: (context, state) => HomeScreen()),
        ],
      ),
      GoRoute(
        path: '/login',
        parentNavigatorKey: _rootNavigatorKey, // shows on root navigator
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
