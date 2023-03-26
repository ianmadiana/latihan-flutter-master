import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List data = [
    {"name": "Opsi ke-1", "data": 1},
    {"name": "Opsi ke-2", "data": 2},
    {"name": "Opsi ke-3", "data": 3},
    {"name": "Opsi ke-4", "data": 4},
  ];

  late int dataAwal;

  @override
  void initState() {
    dataAwal = data[0]["data"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dropdown Menu"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: DropdownButton<int>(
              value: dataAwal,
              items: data
                  .map(
                    (e) => DropdownMenuItem(
                      value: e['data'] as int,
                      child: Text("${e['name']}"),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  dataAwal = value!;
                });
              }),
        ),
      ),
    );
  }
}
