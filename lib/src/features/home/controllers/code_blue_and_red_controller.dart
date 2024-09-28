import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CodeBlueAndRedController extends GetxController {
  var isLoadingBlue = false.obs;
  var isLoadingRed = false.obs;

  var bagianBlue = "".obs;
  var shiftBlue = "".obs;

  var bagianRed = "".obs;
  var shiftRed = "".obs;
  var zonaRed = "".obs;

  var isEmptyDataBlue = true.obs;
  var isEmptyDataRed = true.obs;

  @override
  void onInit() {
    super.onInit();
    getCodeBlue();
    getCodeRed();
  }

  Future<void> getCodeBlue() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingBlue(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/codeblue"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isEmptyDataBlue.value = json['data'] == null ? true : false;
        if (json['data'] != null) {
          bagianBlue.value = json['data']['tanggal'];
          shiftBlue.value = json['data']['shift'];
        } else {
          bagianBlue.value = "";
          shiftBlue.value = "";
        }
      } else {
        debugPrint("Terjadi kesalahan get data Code blue");
      }
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingBlue(false);
    }
  }

  Future<void> getCodeRed() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingRed(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/codered"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isEmptyDataBlue.value = json['data'] == null ? true : false;
        if (json['data'] != null) {
          bagianRed.value = json['data']['tanggal'];
          shiftRed.value = json['data']['shift'];
          zonaRed.value = json['data']['zona'];
        } else {
          bagianRed.value = "";
          shiftRed.value = "";
          zonaRed.value = "";
        }
      } else {
        debugPrint("Terjadi kesalahan get data Code Red");
      }
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingRed(false);
    }
  }
}
