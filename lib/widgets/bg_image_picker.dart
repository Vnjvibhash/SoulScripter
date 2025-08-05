import 'package:flutter/material.dart';

class BgImagePicker extends StatelessWidget {
  final VoidCallback onPick;

  const BgImagePicker({super.key, required this.onPick});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.image),
      onPressed: onPick,
      tooltip: 'Pick background image',
    );
  }
}
