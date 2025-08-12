import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulscripter/widgets/gradient_button.dart';

class FontFamilySelector extends StatelessWidget {
  final List<String> fonts;
  final String selectedFont;
  final ValueChanged<String> onChanged;

  const FontFamilySelector({
    super.key,
    required this.fonts,
    required this.selectedFont,
    required this.onChanged,
  });

  void _openFontFamilyDialog(BuildContext context) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        String tempSelected = selectedFont;
        return StatefulBuilder(
          builder: (context, setState) => SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Select Font Family',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: fonts.length,
                    itemBuilder: (ctx, index) {
                      String font = fonts[index];
                      final bool isSelected = font == tempSelected;
                      return ListTile(
                        title: Text(font, style: GoogleFonts.getFont(font)),
                        trailing: isSelected
                            ? const Icon(Icons.check, color: Colors.blue)
                            : null,
                        selected: isSelected,
                        onTap: () {
                          setState(() {
                            tempSelected = font;
                          });
                          onChanged(font);
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GradientButton(
                    text: 'Done',
                    onPressed: () => Navigator.of(ctx).pop(),
                    gradientColors: [
                      theme.colorScheme.primary,
                      theme.colorScheme.secondary,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _openFontFamilyDialog(context),
      child: Text('Font: $selectedFont'),
    );
  }
}
