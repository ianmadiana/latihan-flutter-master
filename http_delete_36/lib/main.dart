import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String data = "Belum ada data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Http Delete"),
        actions: [
          IconButton(
            onPressed: () async {
              var response =
                  await http.get(Uri.parse("https://reqres.in/api/users/2"));
              Map<String, dynamic> mybody = json.decode(response.body);
              setState(() {
                data =
                    "Account: ${mybody['data']['first_name']} ${mybody['data']['last_name']}";
              });
            },
            icon: Icon(Icons.download),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text(data),
          SizedBox(height: 40),
          ElevatedButton(
            onPressed: () async {
              var response =
                  await http.delete(Uri.parse("https://reqres.in/api/users/2"));
              setState(() {
                if (response.statusCode == 204) {
                  setState(() {
                    data = "Akun berhasil dihapus";
                  });
                } else {
                  data = "Akun gagal dihapus";
                }
              });
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
  }
}
