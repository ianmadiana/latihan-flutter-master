// To parse this JSON data, do
//
//     final gempaModel = gempaModelFromJson(jsonString);

import 'dart:convert';

GempaModel gempaModelFromJson(String str) => GempaModel.fromJson(json.decode(str));

String gempaModelToJson(GempaModel data) => json.encode(data.toJson());

class GempaModel {
    GempaModel({
        required this.infogempa,
    });

    Infogempa infogempa;

    factory GempaModel.fromJson(Map<String, dynamic> json) => GempaModel(
        infogempa: Infogempa.fromJson(json["Infogempa"]),
    );

    Map<String, dynamic> toJson() => {
        "Infogempa": infogempa.toJson(),
    };
}

class Infogempa {
    Infogempa({
        required this.gempa,
    });

    List<Gempa> gempa;

    factory Infogempa.fromJson(Map<String, dynamic> json) => Infogempa(
        gempa: List<Gempa>.from(json["gempa"].map((x) => Gempa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "gempa": List<dynamic>.from(gempa.map((x) => x.toJson())),
    };
}

class Gempa {
    Gempa({
        required this.tanggal,
        required this.jam,
        required this.dateTime,
        required this.coordinates,
        required this.lintang,
        required this.bujur,
        required this.magnitude,
        required this.kedalaman,
        required this.wilayah,
        required this.potensi,
    });

    String tanggal;
    String jam;
    DateTime dateTime;
    String coordinates;
    String lintang;
    String bujur;
    String magnitude;
    String kedalaman;
    String wilayah;
    Potensi potensi;

    factory Gempa.fromJson(Map<String, dynamic> json) => Gempa(
        tanggal: json["Tanggal"],
        jam: json["Jam"],
        dateTime: DateTime.parse(json["DateTime"]),
        coordinates: json["Coordinates"],
        lintang: json["Lintang"],
        bujur: json["Bujur"],
        magnitude: json["Magnitude"],
        kedalaman: json["Kedalaman"],
        wilayah: json["Wilayah"],
        potensi: potensiValues.map[json["Potensi"]]!,
    );

    Map<String, dynamic> toJson() => {
        "Tanggal": tanggal,
        "Jam": jam,
        "DateTime": dateTime.toIso8601String(),
        "Coordinates": coordinates,
        "Lintang": lintang,
        "Bujur": bujur,
        "Magnitude": magnitude,
        "Kedalaman": kedalaman,
        "Wilayah": wilayah,
        "Potensi": potensiValues.reverse[potensi],
    };
}

enum Potensi { TIDAK_BERPOTENSI_TSUNAMI }

final potensiValues = EnumValues({
    "Tidak berpotensi tsunami": Potensi.TIDAK_BERPOTENSI_TSUNAMI
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
