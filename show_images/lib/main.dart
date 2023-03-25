import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Show Images'),
          ),
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                height: 300,
                width: 200,
                child: Image.network(
                  // API images
                  'https://picsum.photos/id/$index/200/300',
                  fit: BoxFit.cover,
                ),
              );
            },
          )),
    );
  }
}
