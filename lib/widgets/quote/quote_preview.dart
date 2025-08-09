import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotePreview extends StatefulWidget {
  final String quote;
  final String fontFamily;
  final File? backgroundImage;
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double initialXFraction;
  final double initialYFraction;
  final bool isEditable;
  final Function(double, double)? onPositionChanged; // only if editable

  const QuotePreview({
    super.key,
    required this.quote,
    required this.fontFamily,
    this.backgroundImage,
    required this.bgColor,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.textAlign,
    this.initialXFraction = 0.5,
    this.initialYFraction = 0.5,
    this.isEditable = true,
    this.onPositionChanged,
  });

  @override
  State<QuotePreview> createState() => _QuotePreviewState();
}

class _QuotePreviewState extends State<QuotePreview> {
  late double _xFraction;
  late double _yFraction;

  @override
  void initState() {
    super.initState();
    _xFraction = widget.initialXFraction;
    _yFraction = widget.initialYFraction;
  }

  void _updatePosition(DragUpdateDetails details, double side) {
    setState(() {
      _xFraction += details.delta.dx / side;
      _yFraction += details.delta.dy / side;
      _xFraction = _xFraction.clamp(0.0, 1.0);
      _yFraction = _yFraction.clamp(0.0, 1.0);
      if (widget.onPositionChanged != null) {
        widget.onPositionChanged!(_xFraction, _yFraction);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final double side = constraints.maxWidth < constraints.maxHeight
            ? constraints.maxWidth
            : constraints.maxHeight;
        return Center(
          child: SizedBox(
            width: side,
            height: side,
            child: GestureDetector(
              onPanUpdate: widget.isEditable
                  ? (details) => _updatePosition(details, side)
                  : null, // disable dragging
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
                child: Align(
                  alignment: Alignment(_xFraction * 2 - 1, _yFraction * 2 - 1),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.quote,
                      textAlign: widget.textAlign,
                      style: GoogleFonts.getFont(
                        widget.fontFamily,
                        fontSize: widget.fontSize,
                        color: widget.textColor,
                        backgroundColor: widget.backgroundImage != null
                            ? Colors.white54
                            : null,
                        fontWeight: widget.fontWeight,
                      ),
                    ),
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
