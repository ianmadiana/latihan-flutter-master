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
        title: const Text("Bottom Sheet"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              builder: (context) => Container(
                height: 250,
                color: Colors.white,
                child: ListView(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.facebook),
                      title: Text("Facebook"),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text("Email"),
                    ),
                    ListTile(
                      leading: Icon(Icons.bluetooth),
                      title: Text("Bluetooth"),
                    ),
                    ListTile(
                      leading: Icon(Icons.wechat),
                      title: Text("Wechat"),
                    ),
                    ListTile(
                      leading: Icon(Icons.browse_gallery),
                      title: Text("Browse"),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text("Click me"),
        ),
      ),
    );
  }
}
