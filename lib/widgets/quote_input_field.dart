import 'package:flutter/material.dart';

class QuoteInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const QuoteInputField({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        hintText: 'Type your quote here...',
        border: OutlineInputBorder(),
      ),
      minLines: 1,
      maxLines: 2,
      onChanged: onChanged,
    );
  }
}
