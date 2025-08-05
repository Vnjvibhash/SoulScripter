import 'package:flutter/material.dart';

class BgColorPicker extends StatelessWidget {
  final Color bgColor;
  final VoidCallback onPick;

  const BgColorPicker({super.key, required this.bgColor, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.palette, color: bgColor),
      onPressed: onPick,
      tooltip: 'Pick background color',
    );
  }
}
