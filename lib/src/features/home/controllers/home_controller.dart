import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/dashboard_statistik_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  DashboardStatistikModel? statistikModel;
  var isLoadingCheckJadwal = false.obs;
  var isLoadingStatistik = false.obs;
  var shift = "".obs;
  var jamMasuk = "".obs;
  var jamPulang = "".obs;
  var isJadwal = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkJadwal();
    getStatistik();
  }

  Future<void> checkJadwal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingCheckJadwal(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/presensi/check-jadwal"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      print(json);
      if (response.statusCode == 200) {
        isJadwal(false);
        shift.value = json['data']['shift'];
        jamMasuk.value = json['data']['jam_masuk'];
        jamPulang.value = json['data']['jam_pulang'];
      } else {
        isJadwal(true);
        debugPrint("Terjadi kesalahan get data jadwal");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingCheckJadwal(false);
    }
  }

  Future<void> getStatistik() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingStatistik(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/statistik-presensi"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        statistikModel = DashboardStatistikModel.fromJson(json);
      } else {
        debugPrint("Terjadi kesalahan get data jadwal");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingStatistik(false);
    }
  }
}
