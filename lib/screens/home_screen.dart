import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:soulscripter/data/sample_data.dart';
import 'package:soulscripter/widgets/quote_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quotes = SampleData.quotes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SoulScripter Quotes'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned.fill(
            child: Shimmer(
              duration: const Duration(seconds: 3),
              interval: const Duration(
                seconds: 0,
              ),
              color: Theme.of(context).colorScheme.primary.withOpacity(
                0.2,
              ),
              colorOpacity: 0.5,
              enabled: true,
              direction:
                  ShimmerDirection.fromLTRB(),
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
          ListView.builder(
            padding: const EdgeInsets.all(18),
            itemCount: quotes.length,
            itemBuilder: (ctx, i) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: QuoteCard(quote: quotes[i]),
              );
            },
          ),
        ],
      ),
    );
  }
}
