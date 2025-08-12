import 'package:flutter/material.dart';
import 'package:soulscripter/widgets/quote/quote_card.dart';
import 'package:soulscripter/widgets/quote/quote_footer.dart';
import 'package:soulscripter/screens/quote_details_screen.dart';

class QuotePost extends StatelessWidget {
  final Map<String, dynamic> quote;
  final bool liked;
  final int likeCount;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;

  const QuotePost({
    super.key,
    required this.quote,
    required this.liked,
    required this.likeCount,
    required this.onLike,
    required this.onComment,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    final commentCount = quote['commentCount'] is int
        ? quote['commentCount']
        : 0;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(26),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 🔹 Make QuoteCard tappable
            GestureDetector(
              onTap: () {
                if (quote['id'] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuoteDetailsScreen(quoteId: quote['id']),
                    ),
                  );
                } else {
                  debugPrint("⚠️ Quote ID missing!");
                }
              },
              child: AspectRatio(
                aspectRatio: 1,
                child: QuoteCard(quoteData: quote),
              ),
            ),

            // Optional Caption
            if (quote['caption'] != null &&
                quote['caption'].toString().trim().isNotEmpty)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                width: double.infinity,
                color: Colors.white,
                child: Text(
                  quote['caption'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),

            // Footer with actions
            QuoteFooter(
              authorName: quote['authorName'] ?? '',
              liked: liked,
              likeCount: likeCount,
              commentCount: commentCount,
              onLike: onLike,
              onComment: onComment,
              onShare: onShare,
            ),
          ],
        ),
      ),
    );
  }
}
