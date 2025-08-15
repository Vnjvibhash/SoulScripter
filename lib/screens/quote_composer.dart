import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulscripter/screens/preview_screen.dart';
import 'package:soulscripter/widgets/font_family_selector.dart';
import 'package:soulscripter/widgets/gradient_button.dart';

class QuoteComposer extends StatefulWidget {
  const QuoteComposer({super.key});

  @override
  State<QuoteComposer> createState() => _QuoteComposerState();
}

class _QuoteComposerState extends State<QuoteComposer> {
  final TextEditingController _textController = TextEditingController(
    text:
        "This story can\ninspire your followers\nto\nchase their dreams\nno matter the challenges.\nWould you like me to help format it nicely\nfor your app\nor\ncreate a quote card version?",
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
    'Lora',
    'Playfair Display',
    'Raleway',
    'Poppins',
    'Nunito',
    'Cormorant Garamond',
    'Abril Fatface',
    'Bebas Neue',
    'Cinzel',
    'Comfortaa',
    'Fira Sans',
    'Quicksand',
    'Josefin Sans',
    'Arvo',
    'Exo 2',
    'Kalam',
    'Satisfy',
    'Teko',
    'Prompt',
    'Teko',
    'Harmattan',
    'Karma',
    'Rajdhani',
    'Mukta',
    'Eczar',
    'Sarala',
    'Hind',
    'Hind Siliguri',
    'Hind Vadodara',
    'Hind Madurai',
    'Hind Guntur',
    'Modak',
    'Palanquin',
    'Khand',
    'Amita',
    'Yatra One',
    'Glegoo',
    'Baloo 2',
    'Pragati Narrow',
    'Patua One',
    'Devonshire',
    'Charmonman',
    'Alegreya Sans SC',
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

  bool get _isQuoteEmpty => _quote.trim().isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Compose Quote"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      hintText: "Type your quote...",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(12),
                    ),
                    maxLines: 15,
                    onChanged: (txt) => setState(() => _quote = txt),
                    style: GoogleFonts.getFont(_fontFamily, fontSize: 18),
                  ),
                  const SizedBox(height: 18),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Choose Font",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FontFamilySelector(
                    fonts: _fonts,
                    selectedFont: _fontFamily,
                    onChanged: (f) => setState(() => _fontFamily = f),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: GradientButton(
                text: 'Preview & Adjust',
                onPressed: _isQuoteEmpty
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
                gradientColors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
                borderRadius: 25,
                padding: const EdgeInsets.symmetric(vertical: 16),
                showShadow: true,
                textStyle: GoogleFonts.lobster(
                  fontSize: 18,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 6,
                      color: Theme.of(context).focusColor,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
