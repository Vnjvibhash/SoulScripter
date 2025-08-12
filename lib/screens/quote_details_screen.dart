import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soulscripter/data/sample_data.dart';
import 'package:soulscripter/providers/quotes_provider.dart';
import 'package:soulscripter/widgets/quote/quote_card.dart';
import 'package:soulscripter/widgets/quote/quote_footer.dart';
import 'package:soulscripter/widgets/comment_card.dart';

class QuoteDetailsScreen extends StatefulWidget {
  final String quoteId;

  const QuoteDetailsScreen({super.key, required this.quoteId});

  @override
  State<QuoteDetailsScreen> createState() => _QuoteDetailsScreenState();
}

class _QuoteDetailsScreenState extends State<QuoteDetailsScreen> {
  bool isLiked = false;
  int likeCount = 0;

  Map<String, dynamic>? quote;
  List<Map<String, dynamic>> postComments = [];
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchQuoteData();
  }

  void _fetchQuoteData() {
    final foundQuote = Provider.of<QuoteProvider>(
      context,
      listen: false,
    ).getQuoteById(widget.quoteId);

    if (foundQuote == null || foundQuote.isEmpty) {
      setState(() {
        quote = null;
        postComments = [];
      });
      return;
    }

    final comments = SampleData.comments
        .where((comment) => comment['quoteId'] == widget.quoteId)
        .toList();

    setState(() {
      quote = foundQuote;
      likeCount = (quote!['likes'] is List) ? quote!['likes'].length : 0;
      postComments = comments;
    });
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  }

  void _addComment() {
    if (_commentController.text.trim().isEmpty) return;
    setState(() {
      postComments.add({
        'userName': 'You',
        'userAvatar': null,
        'text': _commentController.text.trim(),
        'createdAt': DateTime.now().toString().substring(0, 16),
        'quoteId': widget.quoteId,
      });
    });
    _commentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    if (quote == null) {
      return Scaffold(body: const Center(child: Text('Quote not found.')));
    }

    final caption = quote!['caption'] ?? '';
    final tags = (quote!['tags'] is List)
        ? List<String>.from(quote!['tags'])
        : [];

    return Scaffold(
      appBar: AppBar(title: const Text('Quote Details')),
      body: Column(
        children: [
          // Scrollable content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                QuoteCard(quoteData: quote!),
                const SizedBox(height: 8),

                // ✅ Passing live likeCount & isLiked
                QuoteFooter(
                  authorName: quote!['authorName'] ?? 'Unknown',
                  authorImage: quote!['authorAvatar'],
                  liked: isLiked,
                  likeCount: likeCount,
                  commentCount: (quote!['commentCount'] ?? postComments.length),
                  onLike: _toggleLike,
                  onComment: () {},
                  onShare: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Share ${quote?['authorName'] ?? 'this user'}\'s quote',
                        ),
                      ),
                    );
                  },
                ),
                const Divider(height: 2),
                // Hashtags
                if (tags.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "$tag",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                // Caption
                if (caption.toString().trim().isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 4,
                    ),
                    child: Text(
                      caption,
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                Row(
                  children: [
                    const Icon(Icons.comment, color: Colors.blue),
                    const SizedBox(width: 8),
                    Text(
                      'Comments (${postComments.length})',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Comments list
                if (postComments.isEmpty)
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      "No comments yet. Be the first to comment!",
                      style: TextStyle(color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  ...postComments.map(
                    (comment) => CommentCard(comment: comment),
                  ),
              ],
            ),
          ),

          // Fixed comment input bar
          Container(
            padding: const EdgeInsets.fromLTRB(8, 6, 8, 10),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        controller: _commentController,
                        minLines: 1,
                        maxLines: 5,
                        style: TextStyle(
                          color: Theme.of(
                            context,
                          ).colorScheme.onPrimaryContainer,
                        ),
                        decoration: InputDecoration(
                          hintText: "Write a comment...",
                          hintStyle: TextStyle(
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimaryContainer.withOpacity(0.6),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: _addComment,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
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
