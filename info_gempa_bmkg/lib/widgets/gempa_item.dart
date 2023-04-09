import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class GempaItem extends StatelessWidget {
  GempaItem({
    super.key,
    required this.wilayah,
    required this.tanggal,
    required this.potensi,
    required this.jam,
    required this.magnitude,
  });

  String wilayah;
  String tanggal;
  String potensi;
  String jam;
  String magnitude;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            wilayah,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          AvatarGlow(
            glowColor: Colors.redAccent,
            endRadius: 30.0,
            child: Material(
              elevation: 8.0,
              shape: const CircleBorder(),
              child: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 15.0,
                child: Text(
                  magnitude,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Text(potensi),
          Text(tanggal),
          Text(jam),
        ],
      ),
    );
  }
}
