import 'dart:math';

import 'package:flutter/material.dart';

class Widgets22 extends StatelessWidget {
  const Widgets22({
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
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(250 / 2),
              border: Border.all(color: Color(0xFF0D47A1), width: 10),
              image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/536/354"),
                  fit: BoxFit.cover)),
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
