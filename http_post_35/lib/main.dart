import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  String hasilResponse = "Belum ada data";

  var indicateColor;
  late String status;

  @override
  void initState() {
    indicateColor = Colors.yellow;
    status = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Put/Patch"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // INDICATOR STATUS
                Icon(
                  Icons.circle,
                  color: indicateColor,
                ),
                Text(status.toString())
              ],
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: nameC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: jobC,
            autocorrect: false,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Job",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 15),
          ElevatedButton(
              onPressed: () async {
                var myresponse = await http.put(
                    Uri.parse("https://reqres.in/api/users/2"),
                    body: {"name": nameC.text, "job": jobC.text});

                Map<String, dynamic> data =
                    jsonDecode(myresponse.body) as Map<String, dynamic>;

                setState(() {
                  hasilResponse = "Name: ${data['name']} - Job: ${data['job']}";
                });
              },
              child: Text("Submit")),
          SizedBox(height: 50),
          Divider(
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hasilResponse),
            ],
          )
        ],
      ),
    );
  }
}
