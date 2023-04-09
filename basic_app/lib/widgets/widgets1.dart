import 'package:flutter/material.dart';

class Widgets1 extends StatelessWidget {
  const Widgets1({
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
          child: Text(
        "Hello World",
        style: TextStyle(fontSize: 50),
      )),
    );
  }
}
