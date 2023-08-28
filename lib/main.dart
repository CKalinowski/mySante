import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator/translator.dart';

import 'model/langue_choose.dart';
import 'pages/disclaimer/disclaimer_page.dart';

final translator = GoogleTranslator();

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LangueChoose())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => SafeArea(child: child!),
      debugShowCheckedModeBanner: false,
      title: 'MySante',
      home: const DisclaimerPage(),
    );
  }
}
