import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulscripter/providers/auth_provider.dart';
import 'package:soulscripter/screens/splash_screen.dart';
import 'package:soulscripter/theme.dart';

/// The main entry point for the application.
void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: const MyApp(),
    ),
  );
}


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

