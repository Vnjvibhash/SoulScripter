import 'package:flutter/material.dart';

class FontSizeSelector extends StatelessWidget {
  final double fontSize;
  final ValueChanged<double> onChanged;

  const FontSizeSelector({
    super.key,
    required this.fontSize,
    required this.onChanged,
  });

  void _openFontSizeDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        double tempSize = fontSize;
        return StatefulBuilder(
          builder: (ctx, setState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adjust Font Size: ${tempSize.toInt()}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  Slider(
                    min: 5,
                    max: 120,
                    divisions: 115,
                    label: tempSize.toInt().toString(),
                    value: tempSize,
                    onChanged: (val) {
                      setState(() => tempSize = val);
                      onChanged(val);
                    },
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(ctx).pop(),
                    child: const Text('Done'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _openFontSizeDialog(context),
      child: Text('Font Size: ${fontSize.toInt()}'),
    );
  }
}
