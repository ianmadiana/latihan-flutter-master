import 'dart:math';

import 'package:flutter/material.dart';

class Widgets17 extends StatelessWidget {
  const Widgets17({
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
        body: GridView.builder(
          itemCount: 50,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return Container(
                width: 150,
                height: 150,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "Hello",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              );
            } else {
              return Container(
                width: 150,
                height: 150,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    "Hello",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ),
              );
            }
          },
        ));
  }
}
