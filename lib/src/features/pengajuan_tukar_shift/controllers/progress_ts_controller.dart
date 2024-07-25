import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/progress_tukar_jadwal_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProgressTukarShiftController extends GetxController {
  ProgressTukarJadwalModel? progressTukarJadwalM;
  var isLoading = false.obs;
  var isLoadingDelete = false.obs;
  var isEmptyData = true.obs;

  @override
  void onInit() {
    getProgress();
    super.onInit();
  }

  Future<void> getProgress() async {
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
        Uri.parse("$base_url/tukar-jadwal/progress/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        progressTukarJadwalM = ProgressTukarJadwalModel.fromJson(json);
        if (progressTukarJadwalM!.data.isEmpty) {
          isEmptyData(false);
        } else {
          isEmptyData(true);
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

  Future<void> deleteProgress(id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingDelete(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.delete(
        Uri.parse("$base_url/tukar-jadwal/$id"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        snackbarSuccess("Berhasil Delete Progress.");
        getProgress();
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingDelete(false);
    }
  }
}
