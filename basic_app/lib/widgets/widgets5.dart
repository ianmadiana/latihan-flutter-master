import 'dart:math';

import 'package:flutter/material.dart';

class Widgets5 extends StatelessWidget {
  const Widgets5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar
        appBar: AppBar(
          leading: const FlutterLogo(),
          title: const Text("My App"),
          actions: [
            IconButton(
                onPressed: () {
                  print("More");
                },
                icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        // Body
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Hello",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
          ),
        ));
  }
}
