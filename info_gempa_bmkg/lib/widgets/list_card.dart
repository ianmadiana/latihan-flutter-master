import 'package:flutter/material.dart';

import '../models/gempa_model.dart';
import 'gempa_item.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.allData,
  });

  final List<Gempa> allData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allData.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 7,
          child: GempaItem(
            wilayah: allData[index].wilayah,
            potensi: "${allData[index].potensi}",
            tanggal: allData[index].tanggal,
            jam: allData[index].jam,
            magnitude: allData[index].magnitude,
          ),
        ),
      ),
    );
  }
}
