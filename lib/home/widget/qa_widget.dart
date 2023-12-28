import 'package:flutter/material.dart';

class QAWidget extends StatelessWidget {
  final String question;
  final String answer;
  const QAWidget({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 10),
          child: TextFormField(
            initialValue: answer,
            readOnly: true,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                border: UnderlineInputBorder()),
          ),
        ),
      ],
    );
  }
}
