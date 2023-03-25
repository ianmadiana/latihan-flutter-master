import 'dart:math';

import 'package:flutter/material.dart';
import './widgets/color_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // List of widget
  // List<ColorContainer> items = List.generate(
  //   20,
  //   (index) => ColorContainer(
  //       teks: "Warna ke-${index + 1}",
  //       warna: Color.fromARGB(255, 200 + Random().nextInt(256),
  //           200 + Random().nextInt(256), 200 + Random().nextInt(256))),
  // );

  // List mapping of data
  // mapping
  List<Map<String, dynamic>> data = List.generate(
      20,
      (index) => {
            "teks": "Warna ke-${index + 1}",
            "warna": Color.fromARGB(255, 200 + Random().nextInt(256),
                200 + Random().nextInt(256), 200 + Random().nextInt(256))
          });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Extract Widget 2"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: data
                .map((e) => ColorContainer(
                      teks: e["teks"],
                      warna: e["warna"],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
