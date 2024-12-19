import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SelesaiLemburController extends GetxController {
  var isLoading = false.obs;
  var isLoadingAbsen = false.obs;
  var isEmptyDataSelesai = true.obs;
  var dataSelesai = <dynamic>[].obs;
  RxMap dataPresensiHarian = {}.obs;
  RxList dataJadwalHarian = [].obs;
  var isLoadingLembur = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDataSelesai(DateTime.now());
    getJadwalHarian();
  }

  Future<void> getDataSelesai(DateTime tgl) async {
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
            "$base_url/lembur/selesai/by-nip?month=${tgl.getMonthNumber()}&year=${tgl.getYear()}"),
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
    String jenisAbsen,
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
      request.fields['jenis'] = jenisAbsen;

      if (file != null || file != "null") {
        request.files
            .add(await http.MultipartFile.fromPath('photo', file.toString()));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil Absen FOTO");
        getDataSelesai(DateTime.now());
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

  Future<void> getJadwalHarian() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingLembur(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/jadwal/harian"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataPresensiHarian.value = json['data'];
        dataJadwalHarian.value = dataPresensiHarian['jadwal'];
      } else {
        debugPrint("Terjadi kesalahan get data presensi harian");
      }
      print(dataPresensiHarian);
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingLembur(false);
    }
  }
}
