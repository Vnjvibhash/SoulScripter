import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulscripter/screens/caption_screen.dart';
import 'package:soulscripter/widgets/color_picker_dialog.dart';
import 'package:soulscripter/widgets/quote_preview.dart';

class PreviewScreen extends StatefulWidget {
  final String quote;
  final String fontFamily;

  const PreviewScreen({super.key, required this.quote, required this.fontFamily});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  File? _backgroundImage;
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;
  double _fontSize = 28;
  TextAlign _align = TextAlign.center;
  late String _fontFamily;

  @override
  void initState() {
    super.initState();
    _fontFamily = widget.fontFamily;
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _backgroundImage = File(picked.path));
  }

  void _pickBgColor() async {
    Color? newColor = await showDialog(
      context: context,
      builder: (ctx) => ColorPickerDialog(currentColor: _bgColor),
    );
    if (newColor != null) setState(() => _bgColor = newColor);
  }

  void _pickTextColor() async {
    Color? newColor = await showDialog(
      context: context,
      builder: (ctx) => ColorPickerDialog(currentColor: _textColor),
    );
    if (newColor != null) setState(() => _textColor = newColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview & Adjust")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: QuotePreview(
              quote: widget.quote,
              fontFamily: _fontFamily,
              backgroundImage: _backgroundImage,
              bgColor: _bgColor,
              textColor: _textColor,
              fontSize: _fontSize,
              textAlign: _align,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Alignment buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.format_align_left,
                        color: _align == TextAlign.left
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => setState(() => _align = TextAlign.left),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.format_align_center,
                        color: _align == TextAlign.center
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () =>
                          setState(() => _align = TextAlign.center),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.format_align_right,
                        color: _align == TextAlign.right
                            ? Colors.blue
                            : Colors.grey,
                      ),
                      onPressed: () => setState(() => _align = TextAlign.right),
                    ),
                  ],
                ),
                // Font size slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.format_size),
                      onPressed: () {},
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Slider(
                        min: 6,
                        max: 120,
                        value: _fontSize,
                        divisions: 115,
                        label: _fontSize.toInt().toString(),
                        onChanged: (v) => setState(() => _fontSize = v),
                      ),
                    ),
                  ],
                ),
                // Color pickers and image picker
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.palette, color: _bgColor),
                      onPressed: _pickBgColor,
                      tooltip: 'Background color',
                    ),
                    IconButton(
                      icon: Icon(Icons.format_color_text, color: _textColor),
                      onPressed: _pickTextColor,
                      tooltip: 'Text color',
                    ),
                    IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: _pickImage,
                      tooltip: "Pick image",
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CaptionScreen(
                    quote: widget.quote,
                    fontFamily: _fontFamily,
                    fontSize: _fontSize,
                    textAlign: _align,
                    bgColor: _bgColor,
                    textColor: _textColor,
                    backgroundImage: _backgroundImage,
                  ),
                ),
              );
            },
            child: const Text('Next: Add Caption & Hashtags'),
          ),
        ],
      ),
    );
  }
}
