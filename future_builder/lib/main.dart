import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Future Builder",
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Map<String, dynamic>> allUser = [];

  // fungsi future
  Future getAllData() async {
    // manual
    // await Future.delayed(Duration(seconds: 4));

    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      List data = (json.decode(response.body) as Map<String, dynamic>)["data"];
      data.forEach((element) {
        allUser.add(element);
        print(allUser);
      });
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
      ),
      body: FutureBuilder(
          // membutuhkan parameter fungsi Future dan snapshot (untuk menangkap connection state/loading data)
          future: getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Get all data please wait..."),
              );
            } else {
              return ListView.builder(
                itemCount: allUser.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${allUser[index]['avatar']}")),
                  title: Text(
                      "${allUser[index]['first_name']} ${allUser[index]['last_name']}"),
                  subtitle: Text("${allUser[index]['email']}"),
                ),
              );
            }
          }),
    );
  }
}
