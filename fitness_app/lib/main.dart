import 'package:fitness_app/design_system/app_design_system.model.dart';
import 'package:fitness_app/home/presentation/view/home.screen.widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final themeMode = ThemeMode.system;
    final ThemeData lightTheme = ThemeData(
      extensions: [
        AppDesignSystem.variant(themeMode: themeMode, locale: locale),
      ],
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xff6750a4),
        contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
      ),
    );
    final ThemeData darkTheme = ThemeData(
      extensions: [
        AppDesignSystem.variant(themeMode: themeMode, locale: locale),
      ],
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color(0xff6750a4),
        contrastLevel: MediaQuery.highContrastOf(context) ? 1.0 : 0.0,
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const HomeScreen(),
    );
  }
}
