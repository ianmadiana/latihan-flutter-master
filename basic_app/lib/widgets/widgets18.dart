import 'dart:math';

import 'package:flutter/material.dart';

class Widgets18 extends StatelessWidget {
  const Widgets18({
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
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: 20,
          itemBuilder: (context, index) {
            if (index % 2 == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      color: Colors.blue,
                      child: const Center(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello ${index + 1}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hello ${index + 1}",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              );
            }
          },
        ));
  }
}
