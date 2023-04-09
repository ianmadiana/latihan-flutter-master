import 'package:flutter/material.dart';
import 'package:info_gempa_bmkg/pages/introduction_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Info Gempa BMKG",
      home: IntroductionPage(),
    );
  }
}
