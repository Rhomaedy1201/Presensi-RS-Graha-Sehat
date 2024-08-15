// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  String message;
  int statusCode;
  Data data;

  ProfileModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  String? tempatLahir;
  DateTime tglLahir;
  String? statusNikah;
  String? prov;
  String? kab;
  String? kec;
  String? desa;
  String? alamat;
  String? sex;
  String? pendidikan;
  String? agama;
  String? telp;
  String? statusUser;
  String? jmlAnak;
  dynamic tglMasuk;
  dynamic tglResign;
  dynamic bpjsKs;
  dynamic bpjsTk;
  int? idUnit;
  int? cuti;
  String? photo;
  dynamic createdAt;
  DateTime? updatedAt;
  int? idJabatan;
  String? namaJabatan;
  String? tglLahirCast;
  String? profilUrl;
  MUnit mUnit;
  List<Jabatan> jabatans;
  List<dynamic> mKaryawanDetail;

  Data({
    required this.id,
    required this.nik,
    required this.nip,
    required this.nama,
    required this.tempatLahir,
    required this.tglLahir,
    required this.statusNikah,
    required this.prov,
    required this.kab,
    required this.kec,
    required this.desa,
    required this.alamat,
    required this.sex,
    required this.pendidikan,
    required this.agama,
    required this.telp,
    required this.statusUser,
    required this.jmlAnak,
    required this.tglMasuk,
    required this.tglResign,
    required this.bpjsKs,
    required this.bpjsTk,
    required this.idUnit,
    required this.cuti,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.idJabatan,
    required this.namaJabatan,
    required this.tglLahirCast,
    required this.profilUrl,
    required this.mUnit,
    required this.jabatans,
    required this.mKaryawanDetail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        nik: json["nik"],
        nip: json["nip"],
        nama: json["nama"],
        tempatLahir: json["tempat_lahir"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        statusNikah: json["status_nikah"],
        prov: json["prov"],
        kab: json["kab"],
        kec: json["kec"],
        desa: json["desa"],
        alamat: json["alamat"],
        sex: json["sex"],
        pendidikan: json["pendidikan"],
        agama: json["agama"],
        telp: json["telp"],
        statusUser: json["status_user"],
        jmlAnak: json["jml_anak"],
        tglMasuk: json["tgl_masuk"],
        tglResign: json["tgl_resign"],
        bpjsKs: json["bpjs_ks"],
        bpjsTk: json["bpjs_tk"],
        idUnit: json["id_unit"],
        cuti: json["cuti"],
        photo: json["photo"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        idJabatan: json["id_jabatan"],
        namaJabatan: json["nama_jabatan"],
        tglLahirCast: json["tgl_lahir_cast"],
        profilUrl: json["profil_url"],
        mUnit: MUnit.fromJson(json["m_unit"]),
        jabatans: List<Jabatan>.from(
            json["jabatans"].map((x) => Jabatan.fromJson(x))),
        mKaryawanDetail:
            List<dynamic>.from(json["m_karyawan_detail"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nip": nip,
        "nama": nama,
        "tempat_lahir": tempatLahir,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "status_nikah": statusNikah,
        "prov": prov,
        "kab": kab,
        "kec": kec,
        "desa": desa,
        "alamat": alamat,
        "sex": sex,
        "pendidikan": pendidikan,
        "agama": agama,
        "telp": telp,
        "status_user": statusUser,
        "jml_anak": jmlAnak,
        "tgl_masuk": tglMasuk,
        "tgl_resign": tglResign,
        "bpjs_ks": bpjsKs,
        "bpjs_tk": bpjsTk,
        "id_unit": idUnit,
        "cuti": cuti,
        "photo": photo,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
        "id_jabatan": idJabatan,
        "nama_jabatan": namaJabatan,
        "tgl_lahir_cast": tglLahirCast,
        "profil_url": profilUrl,
        "m_unit": mUnit.toJson(),
        "jabatans": List<dynamic>.from(jabatans.map((x) => x.toJson())),
        "m_karyawan_detail": List<dynamic>.from(mKaryawanDetail.map((x) => x)),
      };
}

class Jabatan {
  int id;
  String nip;
  int idJabatan;
  dynamic idParent;
  dynamic createdAt;
  dynamic updatedAt;
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
  String? nama;
  dynamic cutiLevel;
  String? level;
  int? idUnit;
  int? idParent;
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

class MUnit {
  int id;
  String nama;
  int idParent;
  dynamic createdAt;
  DateTime updatedAt;

  MUnit({
    required this.id,
    required this.nama,
    required this.idParent,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MUnit.fromJson(Map<String, dynamic> json) => MUnit(
        id: json["id"],
        nama: json["nama"],
        idParent: json["id_parent"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "id_parent": idParent,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
