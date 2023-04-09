import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Counter with Image"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CounterImage(counter: counter),
            const SizedBox(height: 10),
            CounterImage(counter: counter + 1),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Image ${counter + 1}",
                  style: const TextStyle(fontSize: 25)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // kurangi sampai = 1
                            if (counter == 0) {
                              print(counter);
                            } else {
                              counter--;
                            }
                          });
                        },
                        child: const Icon(Icons.remove)),
                    const Text("Remove")
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter = 0;
                          });
                        },
                        child: const Icon(Icons.restore)),
                    const Text("Reset"),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: const Icon(Icons.add)),
                    const Text("Add")
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterImage extends StatelessWidget {
  const CounterImage({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/id/$counter/200/300"),
              fit: BoxFit.cover)),
    );
  }
}
