import 'package:flutter/material.dart';

void main() {
  // menjalankan class MyApp
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // mem-build semua widget dasar di aplikasi
  Widget build(BuildContext context) {
    // widget dasar aplikasi yaitu MaterialApp
    return MaterialApp(
      // menghilangkan banner debug
      debugShowCheckedModeBanner: false,
      // home adalah tampilan utama aplikasi
      // yang didalamnya terdapat widget scaffold
      // di dalam widget scaffold terdapat widget appbar dan body
      home: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          title: const Center(child: Text('My First Apps')),
        ),
        // diberikan padding agar terdapat jarak di tepi aplikasi
        // dibungkus padding
        body: const Padding(
          // ketebalan padding
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec condimentum mattis mauris, quis eleifend augue efficitur nec. Proin lacinia velit ac magna pulvinar bibendum. Praesent non tincidunt nisi. In commodo augue sit amet massa tincidunt, in dictum purus aliquet. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;',
              // max line dari text
              maxLines: 3,
              // jika text terlalu panjang maka akan ada titik 3 (elipsis)
              overflow: TextOverflow.ellipsis,
              // text rata tengah
              textAlign: TextAlign.justify,
              // style dari font
              style: TextStyle(
                  // costum font ada di folder fonts dan atur di pubsec.yaml, restart aplikasi
                  fontFamily: 'DancingScript',
                  fontSize: 20,
                  // dekorasi teks
                  decoration: TextDecoration.lineThrough,
                  // ketebalan font
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
