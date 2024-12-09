import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelesaiLemburController extends GetxController {
  var isLoading = false.obs;
  var isEmptyDataSelesai = true.obs;
  var dataSelesai = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDataSelesai();
  }

  Future<void> getDataSelesai() async {
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
        Uri.parse("$base_url/lembur/selesai/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataSelesai.value = json['data'];
        if (dataSelesai.value.length > 0) {
          isEmptyDataSelesai(false);
        } else {
          isEmptyDataSelesai(true);
        }
      } else {
        debugPrint("Terjadi kesalahan get data selesai lembur");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
