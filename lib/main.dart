import 'package:flutter/material.dart';

import 'disclaimer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      title: 'MySante',
      home: const Disclaimer(),
    );
  }
}
