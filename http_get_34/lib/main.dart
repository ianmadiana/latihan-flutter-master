import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as myhttp;

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
  late String body;
  late String pic;
  late String id;
  late String name;
  late String email;
  var indicateColor;
  late String status;

  @override
  void initState() {
    body = "";
    pic = "";
    id = "";
    name = "";
    email = "";
    indicateColor = Colors.yellow;
    status = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http Get"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(pic),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("ID : $id"),
            Text("Name : $name"),
            Text("Email : $email"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                var myresponse = await myhttp.get(
                  Uri.parse("https://reqres.in/api/users/3"),
                );
                if (myresponse.statusCode == 200) {
                  Map<String, dynamic> data =
                      jsonDecode(myresponse.body) as Map<String, dynamic>;
                  setState(() {
                    // berhasil
                    pic = data["data"]["avatar"];
                    id = data["data"]["id"].toString();
                    name =
                        "${data["data"]["first_name"]} ${data["data"]["last_name"]}";
                    email = data["data"]["email"].toString();
                    indicateColor = const Color.fromARGB(255, 61, 244, 70);
                    status = "${myresponse.statusCode} OK";
                  });
                } else {
                  // gagal
                  body = "${myresponse.statusCode}";
                  indicateColor = Colors.red;
                  status = "${myresponse.statusCode}";
                }
              },
              child: const Text("Get Data"),
            )
          ],
        ),
      ),
    );
  }
}
