import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:soulscripter/screens/intro_screen.dart';
import 'package:soulscripter/screens/login_screen.dart';
import 'package:soulscripter/screens/main_screen.dart';
import 'package:soulscripter/widgets/shimmer_bg.dart';
import 'package:soulscripter/providers/auth_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  /// Initializes the application and navigates to the appropriate screen after splash delay.
  Future<void> _initializeApp() async {
    // Ensure layout is ready
    await Future.microtask(() {});

    final prefs = await SharedPreferences.getInstance();
    final auth = Provider.of<AuthProvider>(context, listen: false);

    // Load login data from SharedPreferences into AuthProvider
    await auth.loadUser();

    bool isFirstLaunch = prefs.getBool('isFirstLaunch') ?? true;

    // Splash delay for visual effect
    await Future.delayed(const Duration(milliseconds: 3000));

    if (!mounted) return;

    if (isFirstLaunch) {
      // Mark as not first launch
      await prefs.setBool('isFirstLaunch', false);
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const IntroScreen()));
    } else {
      if (auth.isLoggedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const MainScreen()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background shimmer effect.
          const ShimmerBackground(),
          // Logo + title scale animation.
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.7, end: 1.2),
              duration: const Duration(milliseconds: 3000),
              curve: Curves.easeOutBack,
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', width: 120),
                  const SizedBox(height: 16),
                  Text(
                    "Soul's Scripter",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
