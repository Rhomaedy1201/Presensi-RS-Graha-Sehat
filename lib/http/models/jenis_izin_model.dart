// To parse this JSON data, do
//
//     final jenisIzinModel = jenisIzinModelFromJson(jsonString);

import 'dart:convert';

JenisIzinModel jenisIzinModelFromJson(String str) =>
    JenisIzinModel.fromJson(json.decode(str));

String jenisIzinModelToJson(JenisIzinModel data) => json.encode(data.toJson());

class JenisIzinModel {
  String message;
  int statusCode;
  List<Datum> data;

  JenisIzinModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory JenisIzinModel.fromJson(Map<String, dynamic> json) => JenisIzinModel(
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
  String kode;
  String nama;
  int acc1;
  int acc2;
  int acc3;
  int accSdm;
  int tahunan;
  int bukti;
  String inputan;

  Datum({
    required this.id,
    required this.kode,
    required this.nama,
    required this.acc1,
    required this.acc2,
    required this.acc3,
    required this.accSdm,
    required this.tahunan,
    required this.bukti,
    required this.inputan,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        kode: json["kode"],
        nama: json["nama"],
        acc1: json["acc1"],
        acc2: json["acc2"],
        acc3: json["acc3"],
        accSdm: json["acc_sdm"],
        tahunan: json["tahunan"],
        bukti: json["bukti"],
        inputan: json["inputan"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "nama": nama,
        "acc1": acc1,
        "acc2": acc2,
        "acc3": acc3,
        "acc_sdm": accSdm,
        "tahunan": tahunan,
        "bukti": bukti,
        "inputan": inputan,
      };
}
