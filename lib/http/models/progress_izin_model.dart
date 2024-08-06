// To parse this JSON data, do
//
//     final progressIzinModel = progressIzinModelFromJson(jsonString);

import 'dart:convert';

ProgressIzinModel progressIzinModelFromJson(String str) =>
    ProgressIzinModel.fromJson(json.decode(str));

String progressIzinModelToJson(ProgressIzinModel data) =>
    json.encode(data.toJson());

class ProgressIzinModel {
  String message;
  int statusCode;
  List<Datum> data;

  ProgressIzinModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ProgressIzinModel.fromJson(Map<String, dynamic> json) =>
      ProgressIzinModel(
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
  DateTime tanggal;
  int? idmIzin;
  String? nip;
  String? nama;
  String? kodeIzin;
  String? izin;
  String? acc1;
  String? acc2;
  String? acc3;
  DateTime? acc1At;
  String? acc2At;
  String? acc3At;
  String accSdm;
  String? accAt;
  String createdBy;
  int accStatus;
  String? ket;
  String? jenisTable;
  String? tanggalCast;
  By acc1By;
  By? acc2By;
  By? acc3By;
  IzinCuti izinCuti;
  String? izinKrs;
  IzinBukti? izinBukti;

  Datum({
    required this.id,
    required this.tanggal,
    required this.idmIzin,
    required this.nip,
    required this.nama,
    required this.kodeIzin,
    required this.izin,
    required this.acc1,
    required this.acc2,
    required this.acc3,
    required this.acc1At,
    required this.acc2At,
    required this.acc3At,
    required this.accSdm,
    required this.accAt,
    required this.createdBy,
    required this.accStatus,
    required this.ket,
    required this.jenisTable,
    required this.tanggalCast,
    required this.acc1By,
    required this.acc2By,
    required this.acc3By,
    required this.izinCuti,
    required this.izinKrs,
    required this.izinBukti,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
        idmIzin: json["idm_izin"],
        nip: json["nip"],
        nama: json["nama"],
        kodeIzin: json["kode_izin"],
        izin: json["izin"],
        acc1: json["acc1"],
        acc2: json["acc2"],
        acc3: json["acc3"],
        acc1At:
            json["acc1_at"] == null ? null : DateTime.parse(json["acc1_at"]),
        acc2At: json["acc2_at"],
        acc3At: json["acc3_at"],
        accSdm: json["acc_sdm"],
        accAt: json["acc_at"],
        createdBy: json["created_by"],
        accStatus: json["acc_status"],
        ket: json["ket"],
        jenisTable: json["jenis_table"],
        tanggalCast: json["tanggal_cast"],
        acc1By: By.fromJson(json["acc1_by"]),
        acc2By: json["acc2_by"] == null ? null : By.fromJson(json["acc2_by"]),
        acc3By: json["acc3_by"] == null ? null : By.fromJson(json["acc3_by"]),
        izinCuti: IzinCuti.fromJson(json["izin_cuti"]),
        izinKrs: json["izin_krs"],
        izinBukti: json["izin_bukti"] == null
            ? null
            : IzinBukti.fromJson(json["izin_bukti"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "idm_izin": idmIzin,
        "nip": nip,
        "nama": nama,
        "kode_izin": kodeIzin,
        "izin": izin,
        "acc1": acc1,
        "acc2": acc2,
        "acc3": acc3,
        "acc1_at": acc1At?.toIso8601String(),
        "acc2_at": acc2At,
        "acc3_at": acc3At,
        "acc_sdm": accSdm,
        "acc_at": accAt,
        "created_by": createdBy,
        "acc_status": accStatus,
        "ket": ket,
        "jenis_table": jenisTable,
        "tanggal_cast": tanggalCast,
        "acc1_by": acc1By.toJson(),
        "acc2_by": acc2By?.toJson(),
        "acc3_by": acc3By?.toJson(),
        "izin_cuti": izinCuti.toJson(),
        "izin_krs": izinKrs,
        "izin_bukti": izinBukti?.toJson(),
      };
}

class By {
  String nip;
  String nama;
  int idJabatan;
  String? namaJabatan;
  List<Jabatan> jabatans;

  By({
    required this.nip,
    required this.nama,
    required this.idJabatan,
    required this.namaJabatan,
    required this.jabatans,
  });

  factory By.fromJson(Map<String, dynamic> json) => By(
        nip: json["nip"],
        nama: json["nama"],
        idJabatan: json["id_jabatan"],
        namaJabatan: json["nama_jabatan"],
        jabatans: List<Jabatan>.from(
            json["jabatans"].map((x) => Jabatan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nip": nip,
        "nama": nama,
        "id_jabatan": idJabatan,
        "nama_jabatan": namaJabatan,
        "jabatans": List<dynamic>.from(jabatans.map((x) => x.toJson())),
      };
}

class Jabatan {
  int id;
  String nip;
  int idJabatan;
  dynamic idParent;
  dynamic createdAt;
  dynamic updatedAt;
  String? namaJabatan;
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
  String? cutiLevel;
  Level level;
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
        level: levelValues.map[json["level"]]!,
        idUnit: json["id_unit"],
        idParent: json["id_parent"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "cuti_level": cutiLevel,
        "level": levelValues.reverse[level],
        "id_unit": idUnit,
        "id_parent": idParent,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum Level { KEPALA, STAF }

final levelValues = EnumValues({"KEPALA": Level.KEPALA, "STAF": Level.STAF});

class IzinBukti {
  int idIzin;

  IzinBukti({
    required this.idIzin,
  });

  factory IzinBukti.fromJson(Map<String, dynamic> json) => IzinBukti(
        idIzin: json["id_izin"],
      );

  Map<String, dynamic> toJson() => {
        "id_izin": idIzin,
      };
}

class IzinCuti {
  int idIzin;
  DateTime mulai;
  DateTime akhir;
  String? pengganti;
  String? mulaiCast;
  String? akhirCast;
  By? penggantiBy;

  IzinCuti({
    required this.idIzin,
    required this.mulai,
    required this.akhir,
    required this.pengganti,
    required this.mulaiCast,
    required this.akhirCast,
    required this.penggantiBy,
  });

  factory IzinCuti.fromJson(Map<String, dynamic> json) => IzinCuti(
        idIzin: json["id_izin"],
        mulai: DateTime.parse(json["mulai"]),
        akhir: DateTime.parse(json["akhir"]),
        pengganti: json["pengganti"],
        mulaiCast: json["mulai_cast"],
        akhirCast: json["akhir_cast"],
        penggantiBy: json["pengganti_by"] == null
            ? null
            : By.fromJson(json["pengganti_by"]),
      );

  Map<String, dynamic> toJson() => {
        "id_izin": idIzin,
        "mulai":
            "${mulai.year.toString().padLeft(4, '0')}-${mulai.month.toString().padLeft(2, '0')}-${mulai.day.toString().padLeft(2, '0')}",
        "akhir":
            "${akhir.year.toString().padLeft(4, '0')}-${akhir.month.toString().padLeft(2, '0')}-${akhir.day.toString().padLeft(2, '0')}",
        "pengganti": pengganti,
        "mulai_cast": mulaiCast,
        "akhir_cast": akhirCast,
        "pengganti_by": penggantiBy?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
