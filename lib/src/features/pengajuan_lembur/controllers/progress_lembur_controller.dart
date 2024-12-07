import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProgressLemburController extends GetxController {
  var isLoadingGet = false.obs;
  var dataProgress = <dynamic>[].obs;
  var isEmptyDataProgress = true.obs;
  List<bool>? isActiveList;

  @override
  void onInit() {
    super.onInit();
    getDataProgress();
  }

  Future<void> getDataProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingGet(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/lembur/progress/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataProgress.value = json['data'];
        if (dataProgress.value.length > 0) {
          isEmptyDataProgress(false);
          isActiveList = List.generate(
            dataProgress.length ?? 0,
            (index) => false,
          );
        } else {
          isEmptyDataProgress(true);
        }
      } else {
        debugPrint("Terjadi kesalahan get data progress lembur");
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingGet(false);
    }
  }
}
