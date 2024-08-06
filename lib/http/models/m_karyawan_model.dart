// To parse this JSON data, do
//
//     final mKaryawanModel = mKaryawanModelFromJson(jsonString);

import 'dart:convert';

MKaryawanModel mKaryawanModelFromJson(String str) =>
    MKaryawanModel.fromJson(json.decode(str));

String mKaryawanModelToJson(MKaryawanModel data) => json.encode(data.toJson());

class MKaryawanModel {
  String message;
  int statusCode;
  Data data;

  MKaryawanModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory MKaryawanModel.fromJson(Map<String, dynamic> json) => MKaryawanModel(
        message: json["message"],
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "data": data.toJson(),
      };
}

class Data {
  int id;
  String? nik;
  String? nip;
  String? nama;
  String? sex;
  String? statusUser;
  String? idUnit;
  int? cuti;

  Data({
    required this.id,
    required this.nik,
    required this.nip,
    required this.nama,
    required this.sex,
    required this.statusUser,
    required this.idUnit,
    required this.cuti,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nik: json["nik"],
        nip: json["nip"],
        nama: json["nama"],
        sex: json["sex"],
        statusUser: json["status_user"],
        idUnit: json["id_unit"],
        cuti: json["cuti"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nip": nip,
        "nama": nama,
        "sex": sex,
        "status_user": statusUser,
        "id_unit": idUnit,
        "cuti": cuti,
      };
}
