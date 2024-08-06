import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/progress_izin_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressIzinController extends GetxController {
  ProgressIzinModel? progressIzinM;
  var isLoading = false.obs;
  var isEmptyData = true.obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
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
        Uri.parse("$base_url/izin/progress/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        progressIzinM = ProgressIzinModel.fromJson(json);
        if (progressIzinM!.data.isEmpty) {
          isEmptyData(true);
        } else {
          isEmptyData(false);
        }
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteData(id) async {
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

      http.Response response = await http.delete(
        Uri.parse("$base_url/izin/$id"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        getData();
        snackbarSuccess("Berhasil menghapus pengajuan.");
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
