// To parse this JSON data, do
//
//     final jadwalModel = jadwalModelFromJson(jsonString);

import 'dart:convert';

JadwalModel jadwalModelFromJson(String str) =>
    JadwalModel.fromJson(json.decode(str));

String jadwalModelToJson(JadwalModel data) => json.encode(data.toJson());

class JadwalModel {
  String message;
  int statusCode;
  List<Datum> data;

  JadwalModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory JadwalModel.fromJson(Map<String, dynamic> json) => JadwalModel(
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
  String tanggal;
  String nip;
  String nama;
  String? kodeShift;
  String? shift;
  int? mulaiAbsen;
  String? jamMasuk;
  int? telatMasuk;
  String? jamPulang;
  int? telatPulang;
  String? updateBy;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? status;

  Datum({
    required this.id,
    required this.tanggal,
    required this.nip,
    required this.nama,
    required this.kodeShift,
    required this.shift,
    required this.mulaiAbsen,
    required this.jamMasuk,
    required this.telatMasuk,
    required this.jamPulang,
    required this.telatPulang,
    required this.updateBy,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: json["tanggal"],
        nip: json["nip"],
        nama: json["nama"],
        kodeShift: json["kode_shift"],
        shift: json["shift"],
        mulaiAbsen: json["mulai_absen"],
        jamMasuk: json["jam_masuk"],
        telatMasuk: json["telat_masuk"],
        jamPulang: json["jam_pulang"],
        telatPulang: json["telat_pulang"],
        updateBy: json["update_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal": tanggal,
        "nip": nip,
        "nama": nama,
        "kode_shift": kodeShift,
        "shift": shift,
        "mulai_absen": mulaiAbsen,
        "jam_masuk": jamMasuk,
        "telat_masuk": telatMasuk,
        "jam_pulang": jamPulang,
        "telat_pulang": telatPulang,
        "update_by": updateBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "status": status,
      };
}
