import 'dart:convert';

DashboardStatistikModel dashboardStatistikModelFromJson(String str) =>
    DashboardStatistikModel.fromJson(json.decode(str));

String dashboardStatistikModelToJson(DashboardStatistikModel data) =>
    json.encode(data.toJson());

class DashboardStatistikModel {
  String message;
  int statusCode;
  Data data;

  DashboardStatistikModel({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory DashboardStatistikModel.fromJson(Map<String, dynamic> json) =>
      DashboardStatistikModel(
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
  String year;
  String month;
  ListClass list;
  Alpa tepat;
  Alpa telat;
  Alpa alpa;
  Izin izin;
  Izin tukarShift;

  Data({
    required this.year,
    required this.month,
    required this.list,
    required this.tepat,
    required this.telat,
    required this.alpa,
    required this.izin,
    required this.tukarShift,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        year: json["year"],
        month: json["month"],
        list: ListClass.fromJson(json["list"]),
        tepat: Alpa.fromJson(json["tepat"]),
        telat: Alpa.fromJson(json["telat"]),
        alpa: Alpa.fromJson(json["alpa"]),
        izin: Izin.fromJson(json["izin"]),
        tukarShift: Izin.fromJson(json["tukar shift"]),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "list": list.toJson(),
        "tepat": tepat.toJson(),
        "telat": telat.toJson(),
        "alpa": alpa.toJson(),
        "izin": izin.toJson(),
        "tukar shift": tukarShift.toJson(),
      };
}

class Alpa {
  int val;
  String label;

  Alpa({
    required this.val,
    required this.label,
  });

  factory Alpa.fromJson(Map<String, dynamic> json) => Alpa(
        val: json["val"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "val": val,
        "label": label,
      };
}

class Izin {
  int val;
  String label;
  String color;
  int? percent;

  Izin({
    required this.val,
    required this.label,
    required this.color,
    this.percent,
  });

  factory Izin.fromJson(Map<String, dynamic> json) => Izin(
        val: json["val"],
        label: json["label"],
        color: json["color"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "val": val,
        "label": label,
        "color": color,
        "percent": percent,
      };
}

class ListClass {
  Izin tepat;
  Izin telat;
  Izin alpa;

  ListClass({
    required this.tepat,
    required this.telat,
    required this.alpa,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        tepat: Izin.fromJson(json["tepat"]),
        telat: Izin.fromJson(json["telat"]),
        alpa: Izin.fromJson(json["alpa"]),
      );

  Map<String, dynamic> toJson() => {
        "tepat": tepat.toJson(),
        "telat": telat.toJson(),
        "alpa": alpa.toJson(),
      };
}
