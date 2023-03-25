import 'dart:math';

import 'package:flutter/material.dart';

class Widgets20 extends StatelessWidget {
  const Widgets20({
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
      body: Stack(
        children: [
          Container(
            height: 250,
            width: 250,
            color: Colors.amber,
          ),
          Container(
            height: 200,
            width: 200,
            color: Colors.blue,
          ),
          Container(
            height: 175,
            width: 175,
            color: Colors.red,
          ),
          Container(
            height: 140,
            width: 140,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
