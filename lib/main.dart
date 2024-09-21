import 'package:bmicalculator/pages/input_page.dart';
import 'package:bmicalculator/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().themeData,
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
