import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

 // List item untuk generate random nomor
  final List<Widget> myList = List.generate(
    100,
    (index) => Text(
      // setiap random nomor index ditambah 1 diubah ke string
      '${index + 1}',
      style: TextStyle(fontSize: 20 + double.parse(index.toString())),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('List View String')),
        ),
        body: ListView(
          children: myList,
        ),
      ),
    );
  }
}
