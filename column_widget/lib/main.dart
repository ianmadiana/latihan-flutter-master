import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Column'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: 400,
              color: Colors.amber,
            ),
            Container(
              height: 50,
              width: 300,
              color: Colors.blue,
            ),
            Container(
              height: 70,
              width: 200,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
