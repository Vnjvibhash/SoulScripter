import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DraggableQuotePreview extends StatefulWidget {
  final File? backgroundImage;
  final Color backgroundColor;
  final String quote;
  final String fontFamily;
  final double fontSize;
  final TextAlign textAlign;
  final Color textColor;

  const DraggableQuotePreview({
    super.key,
    required this.backgroundImage,
    required this.backgroundColor,
    required this.quote,
    required this.fontFamily,
    required this.fontSize,
    required this.textAlign,
    required this.textColor,
  });

  @override
  State<DraggableQuotePreview> createState() => _DraggableQuotePreviewState();
}

class _DraggableQuotePreviewState extends State<DraggableQuotePreview> {
  double _xFraction = 0.5;
  double _yFraction = 0.5;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanUpdate: (details) {
            setState(() {
              _xFraction += details.delta.dx / constraints.maxWidth;
              _yFraction += details.delta.dy / constraints.maxHeight;
              _xFraction = _xFraction.clamp(0.0, 1.0);
              _yFraction = _yFraction.clamp(0.0, 1.0);
            });
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: widget.backgroundImage == null
                  ? widget.backgroundColor
                  : null,
              image: widget.backgroundImage != null
                  ? DecorationImage(
                      image: FileImage(widget.backgroundImage!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: Align(
              alignment: Alignment((_xFraction * 2) - 1, (_yFraction * 2) - 1),
              child: Padding(
                padding: const EdgeInsets.all(34.0),
                child: Text(
                  widget.quote,
                  textAlign: widget.textAlign,
                  style: GoogleFonts.getFont(
                    widget.fontFamily,
                    fontSize: widget.fontSize,
                    color: widget.textColor,
                    backgroundColor: widget.backgroundImage == null
                        ? null
                        : Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
