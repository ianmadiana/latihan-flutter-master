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

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Snackbar"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("This is snackbar"),
                action: SnackBarAction(
                  label: "Ok",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Warning"),
                        actions: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text("ok"),
                          )
                        ],
                      ),
                    );
                  },
                ),
                margin: EdgeInsets.all(20),
                behavior: SnackBarBehavior.floating,
                dismissDirection: DismissDirection.startToEnd,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            );
          },
          child: Text("Click me!"),
        ),
      ),
    );
  }
}
