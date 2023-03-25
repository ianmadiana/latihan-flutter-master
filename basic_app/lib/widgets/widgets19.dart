import 'dart:math';

import 'package:flutter/material.dart';

class Widgets19 extends StatelessWidget {
  const Widgets19({
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
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://picsum.photos/id/${45 + index}/200/300"),
                      fit: BoxFit.cover)),
              child: Text(
                "Hello ${index + 1}",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ));
  }
}
