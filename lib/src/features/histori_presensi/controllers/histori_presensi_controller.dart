import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/histori_presensi_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HistoriPresensiController extends GetxController {
  HistoriPresensiModel? historiPresensiM;
  var isLoading = false.obs;
  var month = DateTime.now().getMonthNumber();
  var year = DateTime.now().getYear();
  var isEmptyData = true.obs;

  @override
  void onInit() {
    super.onInit();
    getHistoriPresensi(month, year);
  }

  Future<void> getHistoriPresensi(month, year) async {
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
        Uri.parse("$base_url/history-presensi?month=$month&year=$year"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        historiPresensiM = HistoriPresensiModel.fromJson(json);
        for (var i = 0; i < historiPresensiM!.data.length; i++) {
          if (historiPresensiM!.data[i].presensi != null) {
            isEmptyData.value = false;
          }
        }
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
