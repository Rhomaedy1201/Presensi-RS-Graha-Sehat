import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/confirm_tukar_jadwal_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ConfirmTukarShiftController extends GetxController {
  ConfirmTukarJadwalModel? confirmTukarJadwalM;
  var isLoading = false.obs;
  var isLoadingAcc = false.obs;
  var isEmptyData = true.obs;

  @override
  void onInit() {
    super.onInit();
    getConfirm();
  }

  Future<void> getConfirm() async {
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
        Uri.parse("$base_url/tukar-jadwal/confirm/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        confirmTukarJadwalM = ConfirmTukarJadwalModel.fromJson(json);
        if (confirmTukarJadwalM!.data.isEmpty) {
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

  Future<void> accConfirm(type, int idIzin) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingAcc(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      Map body = {
        "type": type, // acc1,acc3, sdm,
        "id_izin": idIzin
      };

      http.Response response = await http.post(
        Uri.parse("$base_url/tukar-jadwal/acc-submit"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        snackbarSuccess("Berhasil Menerima Pengajuan.");
        getConfirm();
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingAcc(false);
    }
  }
}
