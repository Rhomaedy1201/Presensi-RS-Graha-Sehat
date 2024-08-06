import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/http/models/m_karyawan_model.dart';
import 'package:presensi_gs/http/models/progress_izin_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmIzinControlller extends GetxController {
  ProgressIzinModel? progressIzinM;
  MKaryawanModel? mKaryawanM;
  var isLoading = false.obs;
  var isLoadingKaryawan = false.obs;
  var isLoadingAcc = false.obs;
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
        Uri.parse("$base_url/izin/confirm/by-nip"),
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
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> getKaryawanByNip(nip) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingKaryawan(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/m-karyawan/by-nip/$nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        mKaryawanM = MKaryawanModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
      print(json);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingKaryawan(false);
    }
  }

  Future<void> accConfirm(jenis, int idIzin) async {
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

      Map body = {"type": jenis, "id_izin": idIzin};

      http.Response response = await http.put(
        Uri.parse("$base_url/izin/acc/submit"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil Menerima Pengajuan.");
        getData();
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingAcc(false);
    }
  }

  Future<void> tolakConfirm(id, ket, jenis) async {
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

      Map body = {'ket': ket, 'jenis': jenis};

      http.Response response = await http.put(
        Uri.parse("$base_url/tolak/form/$id"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil Menolak Pengajuan.");
        getData();
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
