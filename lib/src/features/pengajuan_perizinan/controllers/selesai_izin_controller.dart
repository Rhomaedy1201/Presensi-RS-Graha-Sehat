import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/selesai_izin_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelesaiIzinController extends GetxController {
  SelesaiIzinModel? selesaiIzinModel;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  @override
  void onInit() {
    getData(DateTime.now());
    super.onInit();
  }

  Future<void> getData(DateTime tgl) async {
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
        Uri.parse(
            "$base_url/izin/selesai/by-nip?month=${tgl.getMonthNumber()}&year=${tgl.getYear()}"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        selesaiIzinModel = SelesaiIzinModel.fromJson(json);
        if (selesaiIzinModel!.data.isEmpty) {
          isEmptyData(true);
        } else {
          isEmptyData(false);
        }
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
