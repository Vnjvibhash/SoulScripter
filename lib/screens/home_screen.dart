import 'package:flutter/material.dart';
import 'package:soulscripter/data/sample_data.dart';
import 'package:soulscripter/utils/quote_storage.dart';
import 'package:soulscripter/widgets/quote/quote_post.dart';
import 'package:soulscripter/widgets/shimmer_bg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> allQuotes = [];
  final Set<int> likedIndexes = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    final savedQuotes = await QuoteStorage.getQuotes();
    setState(() {
      allQuotes = [...savedQuotes, ...SampleData.quotes];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SoulScripter Quotes')),
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          // Shimmer animated background
          const ShimmerBackground(),
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (allQuotes.isEmpty)
            Center(
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
            )
          else
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              itemCount: allQuotes.length,
              itemBuilder: (ctx, i) {
                final quote = allQuotes[i];
                final isLiked = likedIndexes.contains(i);
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
                          content: Text(
                            'Share ${quote['authorName']}\'s quote',
                          ),
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
