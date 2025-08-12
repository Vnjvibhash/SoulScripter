import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteCard extends StatelessWidget {
  final Map<String, dynamic> quoteData;

  const QuoteCard({super.key, required this.quoteData});

  @override
  Widget build(BuildContext context) {
    final design = quoteData['design'];

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

    double xFraction = design['xFraction'] ?? 0.5;
    double yFraction = design['yFraction'] ?? 0.5;

    // Support multiple types for background image
    final dynamic bgImageData = design['backgroundImage'];

    ImageProvider? backgroundImageProvider;

    if (bgImageData != null) {
      if (bgImageData is File) {
        backgroundImageProvider = FileImage(bgImageData);
      } else if (bgImageData is String) {
        if (bgImageData.startsWith('http') || bgImageData.startsWith('https')) {
          backgroundImageProvider = NetworkImage(bgImageData);
        } else if (bgImageData.isNotEmpty) {
          backgroundImageProvider = FileImage(File(bgImageData));
        }
      }
    }

    return AspectRatio(
      aspectRatio: 1,
      child: Material(
        elevation: 4,
        child: ClipRRect(
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
                      color: backgroundImageProvider == null ? bgColor : null,
                      image: backgroundImageProvider != null
                          ? DecorationImage(
                              image: backgroundImageProvider,
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
                            backgroundColor: backgroundImageProvider != null
                                ? Colors.transparent
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
