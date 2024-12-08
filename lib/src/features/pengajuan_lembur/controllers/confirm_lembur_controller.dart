import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ConfirmLemburController extends GetxController {
  var isLoadingGet = false.obs;
  var isLoadingAcc = false.obs;
  var dataConfirm = <dynamic>[].obs;
  var isEmptyDataConfirm = true.obs;
  var nip = "".obs;
  List<bool>? isActiveList;

  @override
  void onInit() {
    super.onInit();
    getDataConfirm();
  }

  Future<void> getDataConfirm() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final nipPref = prefs.getString('nip');
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
        Uri.parse("$base_url/lembur/confirm/by-nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataConfirm.value = json['data'];
        if (dataConfirm.value.length > 0) {
          isEmptyDataConfirm(false);
          isActiveList = List.generate(
            dataConfirm.length ?? 0,
            (index) => false,
          );
        } else {
          isEmptyDataConfirm(true);
        }
      } else {
        debugPrint("Terjadi kesalahan get data progress lembur");
      }
      nip.value = nipPref ?? "null";
      print(nip.value);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingGet(false);
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

      Map body = {"type": type, "id_lembur": idIzin};

      http.Response response = await http.put(
        Uri.parse("$base_url/lembur/acc/submit"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        snackbarSuccess("Berhasil Menerima Pengajuan.");
        getDataConfirm();
      } else {
        debugPrint(response.body.toString());
      }
      print(response.body);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingAcc(false);
    }
  }
}
