import 'package:flutter/material.dart';

class TextAligner extends StatelessWidget {
  final TextAlign alignment;
  final ValueChanged<TextAlign> onChanged;

  const TextAligner({
    super.key,
    required this.alignment,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.format_align_left,
            color: alignment == TextAlign.left ? Colors.blue : Colors.grey,
          ),
          onPressed: () => onChanged(TextAlign.left),
          tooltip: 'Align Left',
        ),
        IconButton(
          icon: Icon(
            Icons.format_align_center,
            color: alignment == TextAlign.center ? Colors.blue : Colors.grey,
          ),
          onPressed: () => onChanged(TextAlign.center),
          tooltip: 'Align Center',
        ),
        IconButton(
          icon: Icon(
            Icons.format_align_right,
            color: alignment == TextAlign.right ? Colors.blue : Colors.grey,
          ),
          onPressed: () => onChanged(TextAlign.right),
          tooltip: 'Align Right',
        ),
      ],
    );
  }
}
