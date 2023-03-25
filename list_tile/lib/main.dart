import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text('List Tile')),
          ),
          // list view agar list bisa di-scroll
          body: ListView(
            // children dari list view
            children: const [
              // list tile #1
              ListTile(
                // padding antar tile
                contentPadding: EdgeInsets.all(10),
                // A widget to display before the title.
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
                title: Text('Ian Madiana'),
                // isi pesan
                subtitle: Text(
                  'Pada hari minggu kuturut ayah ke kota, naik delman istimewa ku duduk di muka',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                // text jam yang berada di kanan
                trailing: Text('12:00 AM'),
              ),
              // pembatas
              Divider(
                color: Colors.black,
              ),
              // // list tile #2
              ListTile(
                  leading: CircleAvatar(),
                  title: Text('Hakuna Matata'),
                  subtitle: Text(
                    'Pada hari minggu kuturut ayah ke kota, naik delman istimewa ku duduk di muka',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  trailing: Text('12:10 AM')),
              Divider(
                color: Colors.black,
              ),
              // // list tile #3
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                ),
                title: Text('Nadine'),
                subtitle: Text(
                  'Pada hari minggu kuturut ayah ke kota, naik delman istimewa ku duduk di muka',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Text('12:00 AM'),
              ),
              Divider(
                color: Colors.black,
              ),
              // list tile #4
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.purple,
                ),
                title: Text('Kirito'),
                subtitle: Text(
                  'Pada hari minggu kuturut ayah ke kota, naik delman istimewa ku duduk di muka',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                trailing: Text('12:00 AM'),
              ),
              Divider(
                color: Colors.black,
              ),
            ],
          )),
    );
  }
}
