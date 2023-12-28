import 'package:flutter/material.dart';
import 'package:my_app/home/view/about_loan_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AboutLoanScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
