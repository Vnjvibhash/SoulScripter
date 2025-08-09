import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulscripter/screens/home_screen.dart';
import 'package:soulscripter/screens/main_screen.dart';
import 'package:soulscripter/utils/quote_storage.dart';
import 'package:soulscripter/widgets/gradient_button.dart';
import 'package:soulscripter/widgets/quote/quote_card.dart';

class CaptionScreen extends StatefulWidget {
  final String quote;
  final String fontFamily;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color bgColor;
  final Color textColor;
  final File? backgroundImage;
  final double xFraction;
  final double yFraction;

  const CaptionScreen({
    super.key,
    required this.quote,
    required this.fontFamily,
    required this.fontSize,
    required this.textAlign,
    required this.fontWeight,
    required this.bgColor,
    required this.textColor,
    required this.backgroundImage,
    required this.xFraction,
    required this.yFraction,
  });

  @override
  State<CaptionScreen> createState() => _CaptionScreenState();
}

class _CaptionScreenState extends State<CaptionScreen> {
  String _caption = '';
  String _hashtags = '';

  @override
  Widget build(BuildContext context) {
    // Build a quoteMap to pass to QuoteCard
    Map<String, dynamic> quoteMap = {
      'text': widget.quote,
      'authorName': 'You', // or your app user name if available
      'commentCount': 0,
      'likes': [],
      'design': {
        'fontFamily': widget.fontFamily,
        'fontWeight': widget.fontWeight,
        'fontSize': widget.fontSize,
        'alignment': widget.textAlign == TextAlign.center
            ? 'center'
            : (widget.textAlign == TextAlign.right ? 'right' : 'left'),
        'backgroundColor': widget.bgColor.value,
        'backgroundImage': widget.backgroundImage,
        'textColor': widget.textColor.value,
        'xFraction': widget.xFraction,
        'yFraction': widget.yFraction,
      },
    };

    return Scaffold(
      appBar: AppBar(title: const Text("Caption & Hashtags")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            QuoteCard(quoteData: quoteMap),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Add a caption (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
              onChanged: (v) => setState(() => _caption = v),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Add hashtags (comma or space separated)',
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => _hashtags = v),
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: GradientButton(
                text: "Finish",
                onPressed: () async {
                  final newQuote = {
                    'text': widget.quote,
                    'authorId': 'user_custom',
                    'authorName': 'You',
                    'authorAvatar': null,
                    'type': 'quote',
                    'likes': [],
                    'commentCount': 0,
                    'createdAt': DateTime.now().toIso8601String(),
                    'design': {
                      'fontFamily': widget.fontFamily,
                      'fontWeight': widget.fontWeight,
                      'fontSize': widget.fontSize,
                      'alignment': widget.textAlign == TextAlign.center
                          ? 'center'
                          : (widget.textAlign == TextAlign.right
                                ? 'right'
                                : 'left'),
                      'backgroundColor': widget.bgColor.value,
                      'backgroundImage':
                          widget.backgroundImage?.path,
                      'textColor': widget.textColor.value,
                      'xFraction': widget.xFraction,
                      'yFraction': widget.yFraction,
                    },
                    'tags': _hashtags
                        .split(RegExp(r'[ ,]+'))
                        .where((t) => t.isNotEmpty)
                        .toList(),
                    'caption': _caption,
                  };

                  await QuoteStorage.saveQuote(newQuote);

                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Quote saved successfully!")),
                  );

                  // Navigate to HomeScreen and clear navigation stack
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainScreen()),
                    (route) => false,
                  );
                },
                gradientColors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                borderRadius: 16,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 24,
                ),
                showShadow: true,
                textStyle: GoogleFonts.pacifico(
                  fontSize: 16,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Theme.of(context).focusColor,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
