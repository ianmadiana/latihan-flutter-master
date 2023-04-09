import 'package:flutter/material.dart';

class Widgets3 extends StatelessWidget {
  const Widgets3({
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
          child: FlutterLogo(
            size: 200,
          ),
        ));
  }
}
