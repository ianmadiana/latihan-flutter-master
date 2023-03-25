import 'dart:math';

import 'package:flutter/material.dart';

class Widgets4 extends StatelessWidget {
  const Widgets4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar
        appBar: AppBar(
          leading: const FlutterLogo(),
          title: Text("My App"),
          actions: [
            IconButton(
                onPressed: () {
                  print("More");
                },
                icon: Icon(Icons.more_vert_rounded))
          ],
        ),
        // Body
        body: Center(
          child: Transform.rotate(
            angle: pi / (180 / 90),
            child: const FlutterLogo(
              size: 200,
            ),
          ),
        ));
  }
}
