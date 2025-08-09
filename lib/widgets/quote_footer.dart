import 'package:flutter/material.dart';

class QuoteFooter extends StatelessWidget {
  final String authorName;
  final String? authorImage;
  final VoidCallback onLike;
  final bool liked;
  final int likeCount;
  final VoidCallback onComment;
  final int commentCount;
  final VoidCallback onShare;

  const QuoteFooter({
    super.key,
    required this.authorName,
    required this.onLike,
    required this.liked,
    required this.likeCount,
    required this.onComment,
    required this.commentCount,
    required this.onShare,
    this.authorImage,
  });

  static String _getAuthorInitials(String name) {
    if (name.trim().isEmpty) return "";
    var parts = name.trim().split(" ");
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts.last[0]).toUpperCase();
  }

  static String _formatCount(int n) {
    if (n >= 1000)
      return '${(n / 1000).toStringAsFixed(n % 1000 == 0 ? 0 : 1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey[300],
            backgroundImage: authorImage != null && authorImage!.isNotEmpty
                ? (authorImage!.startsWith('http')
                          ? NetworkImage(authorImage!)
                          : AssetImage(authorImage!))
                      as ImageProvider
                : null,
            child: (authorImage == null || authorImage!.isEmpty)
                ? Text(
                    _getAuthorInitials(authorName),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              authorName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            icon: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: Colors.pink,
              size: 20,
            ),
            onPressed: onLike,
            tooltip: liked ? "Unlike" : "Like",
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const SizedBox(width: 2),
          Text(_formatCount(likeCount), style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.comment, color: Colors.blue, size: 20),
            onPressed: onComment,
            tooltip: "Comment",
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const SizedBox(width: 2),
          Text(
            _formatCount(commentCount),
            style: const TextStyle(fontSize: 13),
          ),
          const SizedBox(width: 12),
          IconButton(
            icon: const Icon(Icons.share, color: Colors.teal, size: 20),
            onPressed: onShare,
            tooltip: "Share",
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
