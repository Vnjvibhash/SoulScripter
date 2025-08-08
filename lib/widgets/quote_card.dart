import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';


class QuoteCard extends StatefulWidget {
  final Map<String, dynamic> quote;
  const QuoteCard({super.key, required this.quote});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard> {
  late int likeCount;
  bool liked = false;

  @override
  void initState() {
    super.initState();
    likeCount = (widget.quote['likes'] as List).length;
  }

  void _toggleLike() {
    setState(() {
      liked = !liked;
      likeCount += liked ? 1 : -1;
    });
  }

  void _onShare() {
    final textToShare =
        '"${widget.quote['text']}"\n- ${widget.quote['authorName']}';
    Share.share(textToShare);
  }

  void _onComment() {
    // Navigate to comment screen, open modal, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Comment pressed! (Implement comment UI/navigation)'),
      ),
    );
  }

@override
  Widget build(BuildContext context) {
    final design = widget.quote['design'];
    final dynamic bgImageField = design['backgroundImage'];
    DecorationImage? backgroundImage;

    if (bgImageField != null &&
        bgImageField is String &&
        bgImageField.isNotEmpty) {
      if (bgImageField.startsWith('http')) {
        backgroundImage = DecorationImage(
          image: NetworkImage(bgImageField),
          fit: BoxFit.cover,
        );
      } else {
        backgroundImage = DecorationImage(
          image: AssetImage(bgImageField),
          fit: BoxFit.cover,
        );
      }
    }

    final Color quoteBgColor = backgroundImage == null
        ? Color(design['backgroundColor'])
        : Colors.transparent;

    final Color textColor = Color(design['textColor']);
    final String fontFamily = design['fontFamily'] ?? 'Roboto';
    final double fontSize = (design['fontSize'] is double)
        ? design['fontSize']
        : (design['fontSize'] as num).toDouble();
    final TextAlign align = (design['alignment'] == 'center')
        ? TextAlign.center
        : TextAlign.left;

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(26),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: Column(
            children: [
              // Quote area with background image/color
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: quoteBgColor,
                    image: backgroundImage,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        widget.quote['text'],
                        textAlign: align,
                        style: GoogleFonts.getFont(
                          fontFamily,
                          fontSize: fontSize,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Separate author and action row with distinct background
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors
                      .white, // Set this to your desired row background color
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(26),
                  ),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey[300],
                      child: Text(
                        _getAuthorInitials(widget.quote['authorName']),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.quote['authorName'],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        liked ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink,
                        size: 20,
                      ),
                      onPressed: _toggleLike,
                      tooltip: liked ? "Unlike" : "Like",
                    ),
                    Text('$likeCount'),
                    IconButton(
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onPressed: _onComment,
                      tooltip: "Comment",
                    ),
                    Text('${widget.quote['commentCount']}'),
                    IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.teal,
                        size: 20,
                      ),
                      onPressed: _onShare,
                      tooltip: "Share",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _getAuthorInitials(String name) {
    if (name.trim().isEmpty) return "";
    var parts = name.trim().split(" ");
    if (parts.length == 1) return parts[0][0].toUpperCase();
    return (parts[0][0] + parts.last[0]).toUpperCase();
  }

}
