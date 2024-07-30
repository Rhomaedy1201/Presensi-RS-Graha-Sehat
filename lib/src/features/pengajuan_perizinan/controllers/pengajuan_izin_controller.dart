import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/karyawan_per_unit_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PengajuanIzinController extends GetxController {
  KaryawanPerUnitModel? karyawanPerUnitM;
  var isLoadingKarayawan = false.obs;
  @override
  void onInit() {
    super.onInit();
    getKaryawanPerUnit();
  }

  Future<void> getKaryawanPerUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingKarayawan(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/tukar-jadwal/karyawan-unit"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        karyawanPerUnitM = KaryawanPerUnitModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingKarayawan(false);
    }
  }
}
