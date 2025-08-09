// lib/widgets/shimmer_background.dart
import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerBackground extends StatelessWidget {
  const ShimmerBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
                Theme.of(context).colorScheme.primaryContainer.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}
