import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulscripter/screens/preview_screen.dart';
import 'package:soulscripter/widgets/font_family_selector.dart';

class QuoteComposer extends StatefulWidget {
  const QuoteComposer({super.key});

  @override
  State<QuoteComposer> createState() => _QuoteComposerState();
}

class _QuoteComposerState extends State<QuoteComposer> {
  final TextEditingController _textController = TextEditingController(
    text:
        "The only way to do great work is to love what you do. Passion fuels purpose, and purpose creates lasting impact.",
  );

  String _quote = '';
  final _fonts = [
    'Roboto',
    'Lobster',
    'Pacifico',
    'Montserrat',
    'Oswald',
    'Open Sans',
    'Merriweather',
    'Indie Flower',
    'Dancing Script',
    'EB Garamond',
  ];
  String _fontFamily = 'Roboto';

  @override
  void initState() {
    super.initState();
    _quote = _textController.text;
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Compose Quote")),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _textController,
            decoration: const InputDecoration(
              hintText: "Type your quote...",
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
            onChanged: (txt) => setState(() => _quote = txt),
            style: GoogleFonts.getFont(_fontFamily),
          ),
          const SizedBox(height: 18),
          FontFamilySelector(
            fonts: _fonts,
            selectedFont: _fontFamily,
            onChanged: (f) => setState(() => _fontFamily = f),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: _quote.isEmpty
                ? null
                : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PreviewScreen(
                          quote: _quote,
                          fontFamily: _fontFamily,
                        ),
                      ),
                    );
                  },
            child: const Text('Next: Preview and Adjust'),
          ),
        ],
      ),
    ),
  );
}
