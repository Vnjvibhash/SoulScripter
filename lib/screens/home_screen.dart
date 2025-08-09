import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:soulscripter/data/sample_data.dart';
import 'package:soulscripter/widgets/quote_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final quotes = SampleData.quotes;
  final Set<int> likedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SoulScripter Quotes'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Shimmer animated background
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
          // List of QuotePosts
          ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            itemCount: quotes.length,
            itemBuilder: (ctx, i) {
              final quote = quotes[i];
              final isLiked = likedIndexes.contains(i);
              // Safe: Fallback to 0 for likes and comments if data is missing
              final likeCount =
                  (quote['likes'] is List ? quote['likes'].length : 0) +
                  (isLiked ? 1 : 0);

              return Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: QuotePost(
                  quote: quote,
                  liked: isLiked,
                  likeCount: likeCount,
                  onLike: () {
                    setState(() {
                      if (isLiked) {
                        likedIndexes.remove(i);
                      } else {
                        likedIndexes.add(i);
                      }
                    });
                  },
                  onComment: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Comment on ${quote['authorName']}\'s post',
                        ),
                      ),
                    );
                  },
                  onShare: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Share ${quote['authorName']}\'s quote'),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
