// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  int statusCode;
  Data data;

  LoginModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
  User user;
  String token;

  Data({
    required this.user,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  String nama;
  String nip;
  String? role;
  String createdAt;
  String? updatedAt;
  List<Jabatan> jabatans;

  User({
    required this.nama,
    required this.nip,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.jabatans,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        nama: json["nama"],
        nip: json["nip"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        jabatans: List<Jabatan>.from(
            json["jabatans"].map((x) => Jabatan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nip": nip,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "jabatans": List<dynamic>.from(jabatans.map((x) => x.toJson())),
      };
}

class Jabatan {
  int id;
  String nip;
  String idJabatan;
  MJabatan mJabatan;

  Jabatan({
    required this.id,
    required this.nip,
    required this.idJabatan,
    required this.mJabatan,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        id: json["id"],
        nip: json["nip"],
        idJabatan: json["id_jabatan"],
        mJabatan: MJabatan.fromJson(json["m_jabatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "id_jabatan": idJabatan,
        "m_jabatan": mJabatan.toJson(),
      };
}

class MJabatan {
  int id;
  String nama;
  int idParent;
  String? cutiLevel;
  String? level;

  MJabatan({
    required this.id,
    required this.nama,
    required this.idParent,
    required this.cutiLevel,
    required this.level,
  });

  factory MJabatan.fromJson(Map<String, dynamic> json) => MJabatan(
        id: json["id"],
        nama: json["nama"],
        idParent: json["id_parent"],
        cutiLevel: json["cuti_level"],
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_parent": idParent,
        "cuti_level": cutiLevel,
        "level": level,
      };
}
