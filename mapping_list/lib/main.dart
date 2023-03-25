import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // data Map
  // berupa data key : value - String : dynamic (bisa diisi tipe apa saja)
  final List<Map<String, dynamic>> myList = [
    {
      "id": 1,
      "Name": "Ian",
      "Age": 25,
      "favFood": [
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza"
      ]
    },
    {
      "id": 2,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
      ]
    },
    {
      "id": 3,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
      ]
    },
    {
      "id": 4,
      "Name": "Ian",
      "Age": 25,
      "favFood": [
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza"
      ]
    },
    {
      "id": 5,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
      ]
    },
    {
      "id": 6,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
      ]
    },
    {
      "id": 5,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
      ]
    },
    {
      "id": 5,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
      ]
    },
    {
      "id": 5,
      "Name": "Nadine",
      "Age": 27,
      "favFood": [
        "Pizza",
        "Burger",
        "Bakmi",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
        "Burger",
        "Pizza",
        "Karedok",
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme for app
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      // home
      home: Scaffold(
        appBar: AppBar(
          title: Text('ID Apps'),
          // center title
          centerTitle: true,
          // background for app bar
          backgroundColor: Theme.of(context).primaryColor,
        ),
        // scrollable list
        body: ListView(
          // data map diubah ke list #171 - 228
          children: myList.map((data) {
            // data yang berisi 'favFood' dimasukkan ke sebuah variabel
            // dengan nama myFavfood berbentuk/bertipe List
            List myFavfood = data['favFood'];
            // card widget
            return Card(
              // rounded card with RoundedRectangleBorder widget
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // jarak antar card
              margin: EdgeInsets.all(10),
              // warna dari theme
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Container(
                // margin dari item yang ada di card
                // jarak item ke card
                margin: EdgeInsets.all(10),
                // baris vertikal
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // row / baris horizontal
                    // berisi avatar dan data ID
                    Row(
                      children: [
                        // Avatar
                        CircleAvatar(
                          // image avatar from network
                          backgroundImage: NetworkImage(
                              // ${data["id"]} digunakan agar image berbeda setiap data
                              'https://picsum.photos/id/${data["id"]}/200/300'),
                        ),
                        // ukuran box dari row (?)
                        const SizedBox(
                          width: 20,
                        ),
                        // vertikal ke bawah
                        Column(
                          // align/rata text mengikuti teks terpanjang
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // data dari list dimasukkan ke child
                          children: [
                            Text('Name: ${data["Name"]}'),
                            Text('Age : ${data["Age"]}'),
                          ],
                        )
                      ],
                    ),
                    // favFood
                    // SingleChildScrollView akan menampilkan semua konten
                    // yang dimasukkan ke dalamnya, terlepas dari ukuran layar perangkat.
                    SingleChildScrollView(
                      // arah scroll horizontal
                      scrollDirection: Axis.horizontal,
                      // menampilkan data makanan secara horizontal (box orange)
                      child: Row(
                        // data dimulai dari kanan
                        mainAxisAlignment: MainAxisAlignment.start,
                        // Mapping data diubah ke list di children
                        children: myFavfood.map((food) {
                          // akan mengembalikan widget container
                          // untuk membungkus list food
                          return Container(
                            // dekorasi untuk container
                            // membutuhkan widget box decoration
                            decoration: BoxDecoration(
                              // border radius untuk box food
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.orangeAccent,
                            ),
                            margin: const EdgeInsets.symmetric(
                              // margin bagian bawah
                              vertical: 10,
                              // margin horizontal antar food
                              horizontal: 8,
                            ),
                            // padding/jarak antar widget
                            padding: const EdgeInsets.all(10),
                            // menampilkan data food, bisa digabung dengan string
                            child: Text(food),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
