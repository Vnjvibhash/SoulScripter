import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:soulscripter/screens/quote_composer.dart';

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
    await Future.wait([
      Future.delayed(const Duration(milliseconds: 3000)),
    ]);

    // Navigate to the QuoteComposer screen if the widget is still mounted.
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const QuoteComposer()),
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
              duration: const Duration(seconds: 3), // Animation duration.
              interval: const Duration(seconds: 0), // No delay between shimmer cycles.
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2), // Shimmer color with opacity.
              colorOpacity: 0.5, // Opacity of the shimmer color itself.
              enabled: true, // Enable the shimmer effect.
              direction: ShimmerDirection.fromLTRB(), // Shimmer direction from left to right, then top to bottom.
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
              tween: Tween(begin: 0.7, end: 1.2), // Scale animation from 0.7 to 1.2.
              duration: const Duration(milliseconds: 3000), // Animation duration.
              curve: Curves.easeOutBack, // Animation curve.
              builder: (context, scale, child) {
                return Transform.scale(scale: scale, child: child); // Apply the scale transformation.
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/logo.png', width: 120), // Application logo.
                  const SizedBox(height: 16),
                  Text(
                    'SoulScripter App',
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
