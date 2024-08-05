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
  int? idUnit;
  dynamic createdAt;
  DateTime updatedAt;
  int? idJabatan;
  String? namaJabatan;
  String? tglLahirCast;
  List<Jabatan> jabatans;

  Data({
    required this.id,
    required this.nik,
    required this.nip,
    required this.nama,
    required this.sex,
    required this.statusUser,
    required this.idUnit,
    required this.createdAt,
    required this.updatedAt,
    required this.idJabatan,
    required this.namaJabatan,
    required this.tglLahirCast,
    required this.jabatans,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nik: json["nik"],
        nip: json["nip"],
        nama: json["nama"],
        sex: json["sex"],
        statusUser: json["status_user"],
        idUnit: json["id_unit"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        idJabatan: json["id_jabatan"],
        namaJabatan: json["nama_jabatan"],
        tglLahirCast: json["tgl_lahir_cast"],
        jabatans: List<Jabatan>.from(
            json["jabatans"].map((x) => Jabatan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nip": nip,
        "nama": nama,
        "sex": sex,
        "status_user": statusUser,
        "id_unit": idUnit,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "id_jabatan": idJabatan,
        "nama_jabatan": namaJabatan,
        "tgl_lahir_cast": tglLahirCast,
        "jabatans": List<dynamic>.from(jabatans.map((x) => x.toJson())),
      };
}

class Jabatan {
  int id;
  String nip;
  int idJabatan;
  dynamic idParent;
  DateTime createdAt;
  DateTime updatedAt;
  String namaJabatan;
  MJabatan mJabatan;

  Jabatan({
    required this.id,
    required this.nip,
    required this.idJabatan,
    required this.idParent,
    required this.createdAt,
    required this.updatedAt,
    required this.namaJabatan,
    required this.mJabatan,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        id: json["id"],
        nip: json["nip"],
        idJabatan: json["id_jabatan"],
        idParent: json["id_parent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        namaJabatan: json["nama_jabatan"],
        mJabatan: MJabatan.fromJson(json["m_jabatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "id_jabatan": idJabatan,
        "id_parent": idParent,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "nama_jabatan": namaJabatan,
        "m_jabatan": mJabatan.toJson(),
      };
}

class MJabatan {
  int id;
  String nama;
  String cutiLevel;
  String level;
  int idUnit;
  int idParent;
  DateTime createdAt;
  DateTime updatedAt;

  MJabatan({
    required this.id,
    required this.nama,
    required this.cutiLevel,
    required this.level,
    required this.idUnit,
    required this.idParent,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MJabatan.fromJson(Map<String, dynamic> json) => MJabatan(
        id: json["id"],
        nama: json["nama"],
        cutiLevel: json["cuti_level"],
        level: json["level"],
        idUnit: json["id_unit"],
        idParent: json["id_parent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "cuti_level": cutiLevel,
        "level": level,
        "id_unit": idUnit,
        "id_parent": idParent,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
