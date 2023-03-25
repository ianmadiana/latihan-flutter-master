import 'dart:math';

import 'package:flutter/material.dart';

class Widgets6 extends StatelessWidget {
  const Widgets6({
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
          // bisa dibungkus dengan ClipOval
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(250 / 2),
              color: Colors.blue,
            ),
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
