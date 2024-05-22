import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String nama;
  String nip;
  dynamic role;
  String? createdAt;
  String? updatedAt;

  UserModel({
    required this.nama,
    required this.nip,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json["nama"],
        nip: json["nip"],
        role: json["role"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "nip": nip,
        "role": role,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
