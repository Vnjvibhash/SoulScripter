import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CaptionScreen extends StatefulWidget {
  final String quote;
  final String fontFamily;
  final double fontSize;
  final TextAlign textAlign;
  final Color bgColor;
  final Color textColor;
  final File? backgroundImage;

  const CaptionScreen({
    required this.quote,
    required this.fontFamily,
    required this.fontSize,
    required this.textAlign,
    required this.bgColor,
    required this.textColor,
    required this.backgroundImage,
    super.key,
  });

  @override
  State<CaptionScreen> createState() => _CaptionScreenState();
}

class _CaptionScreenState extends State<CaptionScreen> {
  String _caption = '';
  String _hashtags = '';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Caption & Hashtags")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          // Show quote preview at top
          SizedBox(
            height: 180,
            child: Container(
              decoration: BoxDecoration(
                color: widget.backgroundImage == null ? widget.bgColor : null,
                image: widget.backgroundImage != null
                    ? DecorationImage(
                        image: FileImage(widget.backgroundImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  widget.quote,
                  textAlign: widget.textAlign,
                  style: GoogleFonts.getFont(
                    widget.fontFamily,
                    fontSize: widget.fontSize,
                    color: widget.textColor,
                    backgroundColor: widget.backgroundImage == null
                        ? null
                        : Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
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
          ElevatedButton(
            onPressed: () {
              // TODO: Implement save/share logic as needed
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Preview Complete"),
                  content: Text(
                    'Quote:\n"${widget.quote}"\n\n'
                    'Caption: $_caption\n'
                    'Hashtags: $_hashtags',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: const Text("Finish"),
          ),
        ],
      ),
    ),
  );
}
