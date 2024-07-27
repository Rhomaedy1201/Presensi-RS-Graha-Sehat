import 'dart:convert';

SelesaiTukarJadwalModel selesaiTukarJadwalModelFromJson(String str) =>
    SelesaiTukarJadwalModel.fromJson(json.decode(str));

String selesaiTukarJadwalModelToJson(SelesaiTukarJadwalModel data) =>
    json.encode(data.toJson());

class SelesaiTukarJadwalModel {
  String message;
  int statusCode;
  List<Datum> data;

  SelesaiTukarJadwalModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory SelesaiTukarJadwalModel.fromJson(Map<String, dynamic> json) =>
      SelesaiTukarJadwalModel(
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
  DateTime tglPihak1;
  DateTime tglPihak2;
  String kdShiftPihak1;
  String kdShiftPihak2;
  String shiftPihak1;
  String shiftPihak2;
  String nipPihak1;
  String namaPihak1;
  String nipPihak2;
  String namaPihak2;
  DateTime accPihak2;
  String accBy;
  dynamic accByAt;
  dynamic accSdm;
  dynamic accAt;
  int accStatus;
  String ket;
  int jenis;
  String createdBy;
  String jenisDesc;
  String tanggalCast;
  String tglPihak1Cast;
  String tglPihak2Cast;
  Acc acc;
  dynamic sdm;
  Acc pihak1;
  Acc pihak2;
  Tolak tolak;

  Datum({
    required this.id,
    required this.tanggal,
    required this.tglPihak1,
    required this.tglPihak2,
    required this.kdShiftPihak1,
    required this.kdShiftPihak2,
    required this.shiftPihak1,
    required this.shiftPihak2,
    required this.nipPihak1,
    required this.namaPihak1,
    required this.nipPihak2,
    required this.namaPihak2,
    required this.accPihak2,
    required this.accBy,
    required this.accByAt,
    required this.accSdm,
    required this.accAt,
    required this.accStatus,
    required this.ket,
    required this.jenis,
    required this.createdBy,
    required this.jenisDesc,
    required this.tanggalCast,
    required this.tglPihak1Cast,
    required this.tglPihak2Cast,
    required this.acc,
    required this.sdm,
    required this.pihak1,
    required this.pihak2,
    required this.tolak,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
        tglPihak1: DateTime.parse(json["tgl_pihak1"]),
        tglPihak2: DateTime.parse(json["tgl_pihak2"]),
        kdShiftPihak1: json["kd_shift_pihak1"],
        kdShiftPihak2: json["kd_shift_pihak2"],
        shiftPihak1: json["shift_pihak1"],
        shiftPihak2: json["shift_pihak2"],
        nipPihak1: json["nip_pihak1"],
        namaPihak1: json["nama_pihak1"],
        nipPihak2: json["nip_pihak2"],
        namaPihak2: json["nama_pihak2"],
        accPihak2: DateTime.parse(json["acc_pihak2"]),
        accBy: json["acc_by"],
        accByAt: json["acc_by_at"],
        accSdm: json["acc_sdm"],
        accAt: json["acc_at"],
        accStatus: json["acc_status"],
        ket: json["ket"],
        jenis: json["jenis"],
        createdBy: json["created_by"],
        jenisDesc: json["jenis_desc"],
        tanggalCast: json["tanggal_cast"],
        tglPihak1Cast: json["tgl_pihak1_cast"],
        tglPihak2Cast: json["tgl_pihak2_cast"],
        acc: Acc.fromJson(json["acc"]),
        sdm: json["sdm"],
        pihak1: Acc.fromJson(json["pihak1"]),
        pihak2: Acc.fromJson(json["pihak2"]),
        tolak: Tolak.fromJson(json["tolak"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "tgl_pihak1":
            "${tglPihak1.year.toString().padLeft(4, '0')}-${tglPihak1.month.toString().padLeft(2, '0')}-${tglPihak1.day.toString().padLeft(2, '0')}",
        "tgl_pihak2":
            "${tglPihak2.year.toString().padLeft(4, '0')}-${tglPihak2.month.toString().padLeft(2, '0')}-${tglPihak2.day.toString().padLeft(2, '0')}",
        "kd_shift_pihak1": kdShiftPihak1,
        "kd_shift_pihak2": kdShiftPihak2,
        "shift_pihak1": shiftPihak1,
        "shift_pihak2": shiftPihak2,
        "nip_pihak1": nipPihak1,
        "nama_pihak1": namaPihak1,
        "nip_pihak2": nipPihak2,
        "nama_pihak2": namaPihak2,
        "acc_pihak2": accPihak2.toIso8601String(),
        "acc_by": accBy,
        "acc_by_at": accByAt,
        "acc_sdm": accSdm,
        "acc_at": accAt,
        "acc_status": accStatus,
        "ket": ket,
        "jenis": jenis,
        "created_by": createdBy,
        "jenis_desc": jenisDesc,
        "tanggal_cast": tanggalCast,
        "tgl_pihak1_cast": tglPihak1Cast,
        "tgl_pihak2_cast": tglPihak2Cast,
        "acc": acc.toJson(),
        "sdm": sdm,
        "pihak1": pihak1.toJson(),
        "pihak2": pihak2.toJson(),
        "tolak": tolak.toJson(),
      };
}

class Acc {
  String nip;
  String nama;
  int idJabatan;
  String namaJabatan;
  List<Jabatan> jabatans;

  Acc({
    required this.nip,
    required this.nama,
    required this.idJabatan,
    required this.namaJabatan,
    required this.jabatans,
  });

  factory Acc.fromJson(Map<String, dynamic> json) => Acc(
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
  String? cutiLevel;
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

class Tolak {
  int idRelation;
  String ket;

  Tolak({
    required this.idRelation,
    required this.ket,
  });

  factory Tolak.fromJson(Map<String, dynamic> json) => Tolak(
        idRelation: json["id_relation"],
        ket: json["ket"],
      );

  Map<String, dynamic> toJson() => {
        "id_relation": idRelation,
        "ket": ket,
      };
}
