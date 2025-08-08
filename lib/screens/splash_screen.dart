import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:soulscripter/screens/intro_screen.dart';

/// A screen that displays a splash animation while the application initializes.
class SplashScreen extends StatefulWidget {
  /// Creates a [SplashScreen].
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

  /// Initializes the application and navigates to the main screen after a delay.
  Future<void> _initializeApp() async {
    // Ensure that the first frame is rendered before starting the animation.
    await Future.microtask(() {});

    // Simulate a delay for the splash screen.
    await Future.wait([Future.delayed(const Duration(milliseconds: 3000))]);

    // Navigate to the QuoteComposer screen if the widget is still mounted.
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const IntroScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background shimmer effect.
          Positioned.fill(
            child: Shimmer(
              duration: const Duration(seconds: 3),
              interval: const Duration(seconds: 0),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              colorOpacity: 0.5,
              enabled: true,
              direction: ShimmerDirection.fromLTRB(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                      Theme.of(
                        context,
                      ).colorScheme.primaryContainer.withOpacity(0.3),
                      Theme.of(context).colorScheme.primary.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),

          // Centered logo and application title with a scaling animation.
          Center(
            child: TweenAnimationBuilder<double>(
              tween: Tween(
                begin: 0.7,
                end: 1.2,
              ), // Scale animation from 0.7 to 1.2.
              duration: const Duration(
                milliseconds: 3000,
              ), // Animation duration.
              curve: Curves.easeOutBack, // Animation curve.
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                ); // Apply the scale transformation.
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                  ), // Application logo.
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
