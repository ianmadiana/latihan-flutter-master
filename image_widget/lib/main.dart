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
          title: const Text('Image Widget'),
        ),
        body: Center(
          // container adalah parent
          child: Container(
              height: 500,
              width: 500,
              color: Colors.black,
              // widget image
              child: const Image(
                // mengambil image dari internet
                image: NetworkImage('https://picsum.photos/250/300'),
                // cara image mengisi parent-nya (memenuhi container)
                fit: BoxFit.fill,
              )
              // Image.asset(
              //   'images/dog-cat.jpg',
              //   fit: BoxFit.cover,
              // ),
              ),
        ),
      ),
    );
  }
}
