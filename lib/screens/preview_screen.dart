import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:soulscripter/screens/caption_screen.dart';
import 'package:soulscripter/widgets/color_picker_dialog.dart';

class PreviewScreen extends StatefulWidget {
  final String quote;
  final String fontFamily;

  const PreviewScreen({
    required this.quote,
    required this.fontFamily,
    super.key,
  });

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  File? _backgroundImage;
  Color _bgColor = Colors.white;
  Color _textColor = Colors.black;
  double _fontSize = 28;
  TextAlign _align = TextAlign.center;
  String _fontFamily = 'Roboto';
  double _xFraction = 0.5, _yFraction = 0.5;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _backgroundImage = File(picked.path));
  }

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final XFile? picked = await picker.pickImage(source: ImageSource.gallery);
  //   if (picked != null) {
  //     CroppedFile? cropped = await ImageCropper().cropImage(
  //       sourcePath: picked.path,
  //       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           lockAspectRatio: true,
  //           initAspectRatio: CropAspectRatioPreset.square,
  //         ),
  //         IOSUiSettings(title: 'Crop Image', aspectRatioLockEnabled: true),
  //       ],
  //     );
  //     if (cropped != null) {
  //       setState(() => _backgroundImage = File(cropped.path));
  //     }
  //   }
  // }

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
  void initState() {
    super.initState();
    _fontFamily = widget.fontFamily;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text("Preview & Adjust")),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              final double side = constraints.maxWidth < constraints.maxHeight
                  ? constraints.maxWidth
                  : constraints.maxHeight;
              return Center(
                child: SizedBox(
                  width: side,
                  height: side,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        _xFraction += details.delta.dx / side;
                        _yFraction += details.delta.dy / side;
                        _xFraction = _xFraction.clamp(0.0, 1.0);
                        _yFraction = _yFraction.clamp(0.0, 1.0);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: _backgroundImage == null ? _bgColor : null,
                        image: _backgroundImage != null
                            ? DecorationImage(
                                image: FileImage(_backgroundImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: Align(
                        alignment: Alignment(
                          _xFraction * 2 - 1,
                          _yFraction * 2 - 1,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            widget.quote,
                            textAlign: _align,
                            style: GoogleFonts.getFont(
                              _fontFamily,
                              fontSize: _fontSize,
                              color: _textColor,
                              backgroundColor: _backgroundImage != null
                                  ? Colors.white54
                                  : null,
                              fontWeight: FontWeight.w500,
                            ),
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
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
                    onPressed: () => setState(() => _align = TextAlign.center),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.format_size),
                    onPressed: () => {},
                    tooltip: 'Font Size',
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
