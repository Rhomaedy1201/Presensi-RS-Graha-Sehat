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
  String? nip;
  String? nama;
  String? kodeShift;
  String? shift;
  int? mulaiAbsen;
  String? jamMasuk;
  int? telatMasuk;
  String? jamPulang;
  int? telatPulang;
  String? updateBy;
  String? createdBy;
  String? status;
  int? libur;
  String? validateBy;
  String? validateAt;
  String? tanggalCast;
  Presensi? presensi;
  List<dynamic>? tukarJadwal;
  List<dynamic>? izin;

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
    required this.createdBy,
    required this.status,
    required this.libur,
    required this.validateBy,
    required this.validateAt,
    required this.tanggalCast,
    required this.presensi,
    required this.tukarJadwal,
    required this.izin,
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
        createdBy: json["created_by"],
        status: json["status"],
        libur: json["libur"],
        validateBy: json["validate_by"],
        validateAt: json["validate_at"],
        tanggalCast: json["tanggal_cast"],
        presensi: json["presensi"] == null
            ? null
            : Presensi.fromJson(json["presensi"]),
        tukarJadwal: List<dynamic>.from(json["tukar_jadwal"].map((x) => x)),
        izin: List<dynamic>.from(json["izin"].map((x) => x)),
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
        "created_by": createdBy,
        "status": status,
        "libur": libur,
        "validate_by": validateBy,
        "validate_at": validateAt,
        "tanggal_cast": tanggalCast,
        "presensi": presensi?.toJson(),
        "tukar_jadwal": List<dynamic>.from(tukarJadwal!.map((x) => x)),
        "izin": List<dynamic>.from(izin!.map((x) => x)),
      };
}

class Presensi {
  int idJadwal;
  String? status;
  String? masuk;
  String? pulang;
  String? tanggalCast;
  String? tglPulangCast;

  Presensi({
    required this.idJadwal,
    required this.status,
    required this.masuk,
    required this.pulang,
    required this.tanggalCast,
    required this.tglPulangCast,
  });

  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
        idJadwal: json["id_jadwal"],
        status: json["status"],
        masuk: json["masuk"],
        pulang: json["pulang"],
        tanggalCast: json["tanggal_cast"],
        tglPulangCast: json["tgl_pulang_cast"],
      );

  Map<String, dynamic> toJson() => {
        "id_jadwal": idJadwal,
        "status": status,
        "masuk": masuk,
        "pulang": pulang,
        "tanggal_cast": tanggalCast,
        "tgl_pulang_cast": tglPulangCast,
      };
}
