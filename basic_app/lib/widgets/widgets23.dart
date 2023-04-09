import 'dart:math';

import 'package:flutter/material.dart';

class Widgets23 extends StatelessWidget {
  const Widgets23({
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipOval(
                  child: Container(
                    height: 270,
                    width: 270,
                    color: Color(0xFF0D47A1),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(250 / 2),
                      border: Border.all(color: Colors.white, width: 10),
                      image: const DecorationImage(
                          image: NetworkImage("https://picsum.photos/536/354"),
                          fit: BoxFit.cover)),
                  height: 250,
                  width: 250,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Was it all dream?",
              style: TextStyle(
                  fontSize: 30,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
