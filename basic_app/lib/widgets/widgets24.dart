import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Widgets24 extends StatelessWidget {
  const Widgets24({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // AppBar
        appBar: AppBar(
          leading: const FlutterLogo(),
          title: const Text("My App"),
          actions: [
            IconButton(
                onPressed: () {
                  if (kDebugMode) {
                    print("More");
                  }
                },
                icon: const Icon(Icons.more_vert_rounded))
          ],
        ),
        // Body
        body: Column(
          children: [ 
            // list view horizontal
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10),
              height: 110,
              // color: Colors.amber,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return Container(
                      height: 110,
                      width: 110,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  } else {
                    return Container(
                      height: 110,
                      width: 110,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                    );
                  }
                },
              ),
            ),

            // list view vertical
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 20,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            color: Colors.blue,
                            child: const Center(),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hello ${index + 1}",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 150,
                            color: Colors.amber,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Hello ${index + 1}",
                            style: const TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
