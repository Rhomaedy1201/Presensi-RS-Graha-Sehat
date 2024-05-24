import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/jadwal_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JadwalController extends GetxController {
  var isLoading = false.obs;
  JadwalModel? jadwalM;

  @override
  void onInit() {
    super.onInit();
    getJadwal();
  }

  Future<void> getJadwal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final nip = prefs.getString('nip');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoading(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/jadwal/$nip/nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwalM = JadwalModel.fromJson(json);
      } else {
        debugPrint("Terjadi kesalahan get data");
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
