import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:info_gempa_bmkg/models/gempa_model.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../widgets/list_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<Gempa> allData = [];

  Future<List<Gempa>?> getAllData() async {
    try {
      var response = await http.get(
          Uri.parse("https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json"));
      if (response.statusCode == 200) {
        List data = (json.decode(response.body)
            as Map<String, dynamic>)["Infogempa"]["gempa"];
        for (var element in data) {
          allData.add(Gempa.fromJson(element));
          // print(allData);
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error $e");
      rethrow;
    }
    return null;
  }

  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Gempabumi Terkini by BMKG'),
      ),
      body: FutureBuilder(
          future: getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Load data...'),
              );
            }
            return ListCard(allData: allData);
          }),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.map, title: 'Discovery'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.message, title: 'Message'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}
