import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LemburController extends GetxController {
  var isLoadingJenis = false.obs;
  var listJenisLembur = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();
    print("test");
    getJenisLembur();
  }

  Future<void> getJenisLembur() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingJenis(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/m-lembur/all/data"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        listJenisLembur.value = json['data'];
      } else {
        debugPrint("Terjadi kesalahan get data jenis lembur");
      }
      print(listJenisLembur);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingJenis(false);
    }
  }
}
