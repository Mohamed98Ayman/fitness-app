import 'package:fitness_app/design_system/app_design_system.model.dart';
import 'package:fitness_app/network/application/services/http.service.dart';
import 'package:fitness_app/routing/router.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/.env");
  await HttpClientService.init('https://exercisedb.p.rapidapi.com/');
  runApp(const ProviderScope(child: MyApp()));
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

    return MaterialApp.router(
      title: 'A-Fitness App',
      darkTheme: darkTheme,
      theme: lightTheme,
      routerConfig: FitnessRouterConfig.router,
    );
  }
}
