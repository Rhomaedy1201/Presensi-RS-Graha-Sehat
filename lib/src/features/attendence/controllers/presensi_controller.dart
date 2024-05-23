import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/http/models/lokasi_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PresensiController extends GetxController {
  var isLoadingLokasi = false.obs;
  LokasiModel? lokasiM;
  var namaLokasi = "".obs;
  var latitude = "".obs;
  var longitude = "".obs;
  var radius = "".obs;

  @override
  void onInit() {
    super.onInit();
    getLokasi();
  }

  Future<void> getLokasi() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingLokasi(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/m-lokasi"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        lokasiM = LokasiModel.fromJson(json);
        print(json);
        for (var i = 0; i < lokasiM!.data.length; i++) {
          if (lokasiM!.data[i].status == "1") {
            namaLokasi.value = lokasiM!.data[i].nama;
            latitude.value = lokasiM!.data[i].latitude;
            longitude.value = lokasiM!.data[i].longitude;
            radius.value = lokasiM!.data[i].radius.toString();
          } else {
            // snackbarfailed("Tidak ada Lokasi");
          }
        }
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingLokasi(false);
    }
  }
}
