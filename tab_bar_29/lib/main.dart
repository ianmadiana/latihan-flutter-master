import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabC = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Tab Bar"),
        bottom: TabBar(controller: tabC, tabs: [
          Tab(
            child: Icon(Icons.camera_alt),
          ),
          Tab(
            text: "Chats",
          ),
          Tab(
            text: "Status",
          ),
          Tab(
            text: "Calls",
          ),
        ]),
      ),
      body: TabBarView(controller: tabC, children: [
        Center(
          child: Text("Camera"),
        ),
        Center(
          child: Text("Chats"),
        ),
        Center(
          child: Text("Status"),
        ),
        Center(
          child: Text("Calls"),
        ),
      ]),
    );
  }
}
