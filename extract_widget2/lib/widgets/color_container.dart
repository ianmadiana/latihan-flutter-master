import 'package:flutter/material.dart';

class ColorContainer extends StatelessWidget {
  const ColorContainer({
    super.key,
    required this.teks,
    required this.warna,
  });

  final String teks;
  final Color warna;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        // width: 200,
        color: warna,
        child: Center(child: Text(teks)));
  }
}
