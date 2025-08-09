import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class QuoteCard extends StatelessWidget {
  final Map<String, dynamic> quoteData;

  const QuoteCard({super.key, required this.quoteData});

  @override
  Widget build(BuildContext context) {
    final design = quoteData['design'];

    // Parse color values safely, converting int to Color
    Color bgColor = design['backgroundColor'] != null
        ? Color(design['backgroundColor'])
        : Colors.white;
    Color textColor = design['textColor'] != null
        ? Color(design['textColor'])
        : Colors.black;

    FontWeight fontWeight;
    switch (design['fontWeight']) {
      case 'normal':
        fontWeight = FontWeight.normal;
        break;
      case 'bold':
        fontWeight = FontWeight.bold;
        break;
      default:
        fontWeight = FontWeight.normal;
    }

    // Parse text alignment from string
    TextAlign textAlign;
    switch (design['alignment']) {
      case 'center':
        textAlign = TextAlign.center;
        break;
      case 'right':
        textAlign = TextAlign.right;
        break;
      case 'left':
      default:
        textAlign = TextAlign.left;
    }

    // Get fixed text position or default
    double xFraction = design['xFraction'] ?? 0.5;
    double yFraction = design['yFraction'] ?? 0.5;

    // Background image, if any, expected to be File or null
    File? bgImage = design['bgImage'];

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(26),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(26),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double side = constraints.maxWidth < constraints.maxHeight
                  ? constraints.maxWidth
                  : constraints.maxHeight;

              return Center(
                child: SizedBox(
                  width: side,
                  height: side,
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgImage == null ? bgColor : null,
                      image: bgImage != null
                          ? DecorationImage(
                              image: FileImage(bgImage),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: Align(
                      alignment: Alignment(
                        xFraction * 2 - 1,
                        yFraction * 2 - 1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          quoteData['text'],
                          textAlign: textAlign,
                          style: GoogleFonts.getFont(
                            design['fontFamily'] ?? 'Roboto',
                            fontSize: (design['fontSize'] is double)
                                ? design['fontSize']
                                : (design['fontSize'] as num).toDouble(),
                            color: textColor,
                            backgroundColor: bgImage != null
                                ? Colors.white54
                                : null,
                            fontWeight: fontWeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
