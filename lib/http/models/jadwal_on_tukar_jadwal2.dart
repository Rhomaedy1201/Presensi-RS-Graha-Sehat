import 'dart:convert';

JadwalOnTukarJadwalModel2 jadwalOnTukarJadwalModelFromJson(String str) =>
    JadwalOnTukarJadwalModel2.fromJson(json.decode(str));

String jadwalOnTukarJadwalModelToJson(JadwalOnTukarJadwalModel2 data) =>
    json.encode(data.toJson());

class JadwalOnTukarJadwalModel2 {
  String message;
  int statusCode;
  List<Datum> data;

  JadwalOnTukarJadwalModel2({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory JadwalOnTukarJadwalModel2.fromJson(Map<String, dynamic> json) =>
      JadwalOnTukarJadwalModel2(
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
  String nip;
  DateTime tanggal;
  String? kodeShift;
  String? shift;
  String? jamMasuk;
  String? jamPulang;
  String? tanggalCast;

  Datum({
    required this.id,
    required this.nip,
    required this.tanggal,
    required this.kodeShift,
    required this.shift,
    required this.jamMasuk,
    required this.jamPulang,
    required this.tanggalCast,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nip: json["nip"],
        tanggal: DateTime.parse(json["tanggal"]),
        kodeShift: json["kode_shift"],
        shift: json["shift"],
        jamMasuk: json["jam_masuk"],
        jamPulang: json["jam_pulang"],
        tanggalCast: json["tanggal_cast"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nip": nip,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "kode_shift": kodeShift,
        "shift": shift,
        "jam_masuk": jamMasuk,
        "jam_pulang": jamPulang,
        "tanggal_cast": tanggalCast,
      };
}
