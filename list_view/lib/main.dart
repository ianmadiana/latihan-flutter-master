import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

// // List item untuk warna
  final List<Color> myColor = [
    Colors.purple,
    Colors.lightBlue,
    Colors.red,
    Colors.yellow,
    Colors.green
  ];

// List item untuk container
  // List<Widget> myList = [
  //   Container(
  //     height: 250,
  //     width: 200,
  //     color: Colors.purple,
  //   ),
  //   Container(
  //     height: 250,
  //     width: 200,
  //     color: Colors.lightBlue,
  //   ),
  //   Container(
  //     height: 250,
  //     width: 200,
  //     color: Colors.red,
  //   ),
  //   Container(
  //     height: 250,
  //     width: 200,
  //     color: Colors.yellow,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('List View')),
      ),
      // ListView.separated (separarasi) - membutuhkan 3 argumen:
      // itemCount, itemBuilder, dan separatorBuilder
      // ListView.builder:
      // membutuhkan dua argumen itemCount, & itemBuilder
      body: ListView.separated(
        separatorBuilder: (context, index) {
          // separator dengan container
          // return Container(
          //   height: 10,
          // );

          // separator dengan divide
          return const Divider(
            color: Colors.amber,
          );
        },
        // 5 buah container yang akan diiterasikan
        itemCount: myColor.length,
        itemBuilder: (context, index) {
          return Container(
            height: 250,
            width: 250,
            color: myColor[index],
          );
        },
        // scroll horizontal
        // scrollDirection: Axis.horizontal,
        // scrollable yang menampung 4 container (hard-code)
        // children: myList,
        // -------------baris kode------------------------
        // children: [
        //   Container(
        //     height: 250,
        //     width: 200,
        //     color: Colors.purple,
        //   ),
        //   Container(
        //     height: 250,
        //     width: 200,
        //     color: Colors.lightBlue,
        //   ),
        //   Container(
        //     height: 250,
        //     width: 200,
        //     color: Colors.red,
        //   ),
        //   Container(
        //     height: 250,
        //     width: 200,
        //     color: Colors.yellow,
        //   ),
        // ],
        // ------------end of baris kode---------
      ),
    ));
  }
}
