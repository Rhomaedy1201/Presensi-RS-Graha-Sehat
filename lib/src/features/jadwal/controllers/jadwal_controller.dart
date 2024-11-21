import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class JadwalController extends GetxController {
  var isLoading = false.obs;
  var month = DateTime.now().getMonthNumber();
  var year = DateTime.now().getYear();
  var isEmptyData = false.obs;
  var jadwalData = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getJadwal(month, year);
  }

  Future<void> getJadwal(month, year) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
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
        Uri.parse("$base_url/jadwalku?month=$month&tahun=$year"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['data'] == null || json['data'].isEmpty) {
          isEmptyData.value = true;
        } else {
          jadwalData.value = json['data'];
          isEmptyData.value = false;
        }
      } else {
        debugPrint("Terjadi kesalahan get data");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
