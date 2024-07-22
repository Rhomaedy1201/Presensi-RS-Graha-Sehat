import 'dart:convert';

AccAtasanModel accAtasanModelFromJson(String str) =>
    AccAtasanModel.fromJson(json.decode(str));

String accAtasanModelToJson(AccAtasanModel data) => json.encode(data.toJson());

class AccAtasanModel {
  String message;
  int statusCode;
  Data data;

  AccAtasanModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory AccAtasanModel.fromJson(Map<String, dynamic> json) => AccAtasanModel(
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
  String nik;
  String nip;
  String nama;
  String sex;
  String statusUser;
  int idUnit;
  String? createdAt;
  DateTime updatedAt;
  int idJabatan;
  String namaJabatan;
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
        "jabatans": List<dynamic>.from(jabatans.map((x) => x.toJson())),
      };
}

class Jabatan {
  int id;
  String nip;
  int idJabatan;
  String? idParent;
  String? createdAt;
  String? updatedAt;
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
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        namaJabatan: json["nama_jabatan"],
        mJabatan: MJabatan.fromJson(json["m_jabatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "id_jabatan": idJabatan,
        "id_parent": idParent,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
