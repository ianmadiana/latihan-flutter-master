import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Drawer"),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                height: 150,
                color: Colors.blue,
                child: Text(
                  "Dashboard Menu",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Profile"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Center(
          child: Text("Drawer"),
        ));
  }
}
