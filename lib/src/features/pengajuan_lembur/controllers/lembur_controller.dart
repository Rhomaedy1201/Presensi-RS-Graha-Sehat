import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LemburController extends GetxController {
  var isLoadingJenis = false.obs;
  var isLoadingStore = false.obs;
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
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingJenis(false);
    }
  }

  Future<void> postLembur(
    Map data,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingStore(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      var uri = Uri.parse("$base_url/lembur");

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      // Add text fields to the request
      request.fields['jenis_lembur'] = data['id'].toString();
      request.fields['tanggal'] = data['tanggal'].toString();
      request.fields['mulai'] = data['mulai'];
      request.fields['akhir'] = data['akhir'];
      request.fields['ket'] = data['ket'] ?? "";

      // Add file to the request
      if (data['file'] != null) {
        request.files
            .add(await http.MultipartFile.fromPath('file', data['file'].path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil mengajukan lembur");
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        isLoadingStore(false);
        debugPrint(responseString);
        snackbarfailed("Terjadi Kesalahan.");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingStore(false);
    }
  }
}
