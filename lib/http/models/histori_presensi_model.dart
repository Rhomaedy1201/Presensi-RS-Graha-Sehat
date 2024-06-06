import 'dart:convert';

HistoriPresensiModel historiPresensiModelFromJson(String str) =>
    HistoriPresensiModel.fromJson(json.decode(str));

String historiPresensiModelToJson(HistoriPresensiModel data) =>
    json.encode(data.toJson());

class HistoriPresensiModel {
  String message;
  int statusCode;
  List<Datum> data;

  HistoriPresensiModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory HistoriPresensiModel.fromJson(Map<String, dynamic> json) =>
      HistoriPresensiModel(
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
  String nip;
  String nama;
  String kodeShift;
  String shift;
  int mulaiAbsen;
  String jamMasuk;
  int telatMasuk;
  String jamPulang;
  int telatPulang;
  String updateBy;
  String createdBy;
  String status;
  int libur;
  String tanggalCast;
  Presensi? presensi;

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
    required this.tanggalCast,
    required this.presensi,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        tanggal: DateTime.parse(json["tanggal"]),
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
        tanggalCast: json["tanggal_cast"],
        presensi: json["presensi"] == null
            ? null
            : Presensi.fromJson(json["presensi"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
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
        "tanggal_cast": tanggalCast,
        "presensi": presensi?.toJson(),
      };
}

class Presensi {
  int idJadwal;
  String status;
  String masuk;
  String pulang;
  // String pulangCast;

  Presensi({
    required this.idJadwal,
    required this.status,
    required this.masuk,
    required this.pulang,
    // required this.pulangCast,
  });

  factory Presensi.fromJson(Map<String, dynamic> json) => Presensi(
        idJadwal: json["id_jadwal"],
        status: json["status"],
        masuk: json["masuk"],
        pulang: json["pulang"],
        // pulangCast: json["pulang_cast"],
      );

  Map<String, dynamic> toJson() => {
        "id_jadwal": idJadwal,
        "status": status,
        "masuk": masuk,
        "pulang": pulang,
        // "pulang_cast": pulangCast,
      };
}
