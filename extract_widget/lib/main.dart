import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import './widgets/chat_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // library dari pub.dev
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Extract Widget'),
        ),
        // dengan menggunakan bilder bisa me-generate jumlah chat secara otomatis
        body: ListView.builder(
          // item count mendefinikan jumlah item yang akan di-generate
          itemCount: 50,
          itemBuilder: (context, index) {
            // ChatItem adalah hasil dari extract widget
            return ChatItem(
                imageUrl: 'https://picsum.photos/id/$index/200/300',
                title: faker.person.name(),
                subtitle: faker.lorem.sentence());
          },
        ),
      ),
    );
  }
}


