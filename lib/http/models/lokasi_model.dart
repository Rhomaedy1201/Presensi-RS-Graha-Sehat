import 'dart:convert';

LokasiModel lokasiModelFromJson(String str) => LokasiModel.fromJson(json.decode(str));

String lokasiModelToJson(LokasiModel data) => json.encode(data.toJson());

class LokasiModel {
    String message;
    int statusCode;
    List<Datum> data;

    LokasiModel({
        required this.message,
        required this.statusCode,
        required this.data,
    });

    factory LokasiModel.fromJson(Map<String, dynamic> json) => LokasiModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String nama;
    String latitude;
    String longitude;
    int radius;
    String status;

    Datum({
        required this.id,
        required this.nama,
        required this.latitude,
        required this.longitude,
        required this.radius,
        required this.status,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        radius: json["radius"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "latitude": latitude,
        "longitude": longitude,
        "radius": radius,
        "status": status,
    };
}
