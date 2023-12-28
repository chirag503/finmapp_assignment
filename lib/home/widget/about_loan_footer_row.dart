import 'package:flutter/material.dart';

/// Custom widget for a footer row with back and next buttons
class AboutLoanFooterRow extends StatelessWidget {
  final void Function()? onBack;
  final void Function()? onNext;

  const AboutLoanFooterRow({Key? key, this.onBack, this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBack,
          child: const Row(
            children: [
              Icon(
                Icons.chevron_left_rounded,
                size: 30,
              ),
              Text(
                "Back",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onNext,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(236, 239, 118, 32),
            ),
            child: const Icon(
              Icons.chevron_right_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
