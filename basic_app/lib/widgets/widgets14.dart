import 'dart:math';

import 'package:flutter/material.dart';

class Widgets14 extends StatelessWidget {
  const Widgets14({
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                SizedBox(height: 20),
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
            ),
            SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                ),
                SizedBox(height: 20),
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
              ],
            ),
          ],
        ));
  }
}
