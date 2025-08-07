import 'package:flutter/material.dart';
import 'package:soulscripter/screens/splash_screen.dart';
import 'package:soulscripter/theme.dart';

/// The main entry point for the application.
void main() => runApp(const MyApp());

/// The root widget of the application.
class MyApp extends StatelessWidget {
  /// Creates the [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soul's Scripter",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

