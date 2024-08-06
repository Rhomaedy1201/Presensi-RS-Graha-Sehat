import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/jenis_izin_model.dart';
import 'package:presensi_gs/http/models/karyawan_per_unit_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PengajuanIzinController extends GetxController {
  KaryawanPerUnitModel? karyawanPerUnitM;
  JenisIzinModel? jenisIzinM;

  var isLoadingKarayawan = false.obs;
  var isLoadingSubmit = false.obs;
  var isLoadingJenisIzin = false.obs;
  var isLoadingJenisIzinByKode = false.obs;
  var nipUser = "".obs;
  var dataJenisIzin = {};

  @override
  void onInit() {
    super.onInit();
    getJenisIzin();
    getKaryawanPerUnit();
  }

  Future<void> getJenisIzin() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingJenisIzin(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/m-izin/all/data"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jenisIzinM = JenisIzinModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingJenisIzin(false);
    }
  }

  Future<void> getJenisIzinByKode(kode) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingJenisIzinByKode(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/m-izin/by-kode/$kode"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      print(json);
      if (response.statusCode == 200) {
        var data = json['data'];
        dataJenisIzin = {
          "id": data[0]['id'],
          "kode": data[0]['kode'],
          "nama": data[0]['nama'],
          "acc1": data[0]['acc1'],
          "acc2": data[0]['acc2'],
          "acc3": data[0]['acc3'],
          "acc_sdm": data[0]['acc_sdm'],
          "tahunan": data[0]['tahunan'],
          "bukti": data[0]['bukti'],
          "inputan": data[0]['inputan']
        };
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      // Timer(const Duration(seconds: 1), () {
      isLoadingJenisIzinByKode(false);
      // });
    }
  }

  Future<void> getKaryawanPerUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final nip = prefs.getString('nip');
    nipUser.value = nip!;
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingKarayawan(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/tukar-jadwal/karyawan-unit"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        karyawanPerUnitM = KaryawanPerUnitModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      // Timer(const Duration(seconds: 1), () {
      isLoadingKarayawan(false);
      // });
    }
  }

  Future<void> postPerizinan(
    String izin,
    String jenis,
    String mulai,
    String? akhir,
    String? pengganti,
    String? ket,
    File? file,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingSubmit(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      var uri = Uri.parse("$base_url/izin");

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      // Add text fields to the request
      request.fields['izin'] = izin;
      request.fields['jenis'] = jenis;
      request.fields['mulai'] = mulai;
      request.fields['akhir'] = akhir ?? "";
      request.fields['pengganti'] = pengganti ?? "";
      request.fields['ket'] = ket ?? "";

      // Add file to the request
      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil menambahkan perizinan");
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        isLoadingSubmit(false);
        debugPrint(responseString);
        snackbarfailed("Terjadi Kesalahan.");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingSubmit(false);
    }
  }
}
