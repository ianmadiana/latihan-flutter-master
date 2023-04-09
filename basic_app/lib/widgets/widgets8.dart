import 'dart:math';

import 'package:flutter/material.dart';

class Widgets8 extends StatelessWidget {
  const Widgets8({
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
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 150,
              width: 150,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Hello",
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ),
            Container(
              height: 150,
              width: 150,
              color: Colors.amber,
              child: const Center(
                child: Text(
                  "Hello",
                  style: TextStyle(color: Colors.black, fontSize: 26),
                ),
              ),
            )
          ],
        ));
  }
}
