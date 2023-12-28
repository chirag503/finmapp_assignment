import 'package:flutter/material.dart';

/// Custom widget for a labeled text input field
class TextFeildQuestionWidget extends StatelessWidget {
  final String label;
  final String? initialValue;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;

  const TextFeildQuestionWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.initialValue,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display the label above the text input field
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        // TextFormField for text input
        TextFormField(
          keyboardType: keyboardType,
          initialValue: initialValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            // Define the input field decoration, including border styles
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.orange, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.orange, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
