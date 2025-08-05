import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/quote_composer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soul's Scripter",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const QuoteComposer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

