import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelesaiLemburController extends GetxController {
  var isLoading = false.obs;
  var isLoadingAbsen = false.obs;
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

  Future<void> postAbsenFOTO(
    String id,
    String? file,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingAbsen(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      var uri = Uri.parse("$base_url/lembur-absen-photo");

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      request.fields['id'] = id;

      if (file != null || file != "null") {
        request.files
            .add(await http.MultipartFile.fromPath('photo', file.toString()));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil Absen FOTO");
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        isLoadingAbsen(false);
        debugPrint(responseString);
        snackbarfailed("Terjadi Kesalahan.");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingAbsen(false);
    }
  }
}
