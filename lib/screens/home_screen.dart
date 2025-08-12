import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:soulscripter/providers/quotes_provider.dart';
import 'package:soulscripter/widgets/quote/quote_post.dart';
import 'package:soulscripter/widgets/shimmer_bg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Set<int> likedIndexes = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<QuoteProvider>(context, listen: false).loadQuotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SoulScripter Quotes'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          const ShimmerBackground(),

          // Loading state
          if (quoteProvider.isLoading)
            const Center(child: CircularProgressIndicator())
          // Empty state
          else if (quoteProvider.allQuotes.isEmpty)
            _buildEmptyState(context)
          // Quote list
          else
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              itemCount: quoteProvider.allQuotes.length,
              itemBuilder: (ctx, i) {
                final quote = quoteProvider.allQuotes[i];
                final isLiked = likedIndexes.contains(i);
                final likeCount =
                    (quote['likes'] is List ? quote['likes'].length : 0) +
                    (isLiked ? 1 : 0);

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
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
                      final textToShare =
                          quote['text'] ?? 'Check out this quote!';
                      SharePlus.instance.share(ShareParams(text: textToShare));
                    },
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inbox, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 18),
          Text(
            "No Quotes Found",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Be the first to share a quote or poem!",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
