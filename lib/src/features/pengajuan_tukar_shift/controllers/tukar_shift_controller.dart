import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/acc_atasan_model.dart';
import 'package:presensi_gs/http/models/jadwal_on_tukar_jadwal.dart';
import 'package:presensi_gs/http/models/jadwal_on_tukar_jadwal2.dart';
import 'package:presensi_gs/http/models/karyawan_per_unit_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TukarJadwalController extends GetxController {
  JadwalOnTukarJadwalModel? jadwalOnTukarJadwalM;
  JadwalOnTukarJadwalModel2? jadwalOnTukarJadwalM2;
  KaryawanPerUnitModel? karyawanPerUnitM;
  AccAtasanModel? accAtasanM;
  TextEditingController ketController = TextEditingController();

  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoadingAcc = false.obs;
  var isLoadingSubmit = false.obs;
  var isLoadingKarayawan = false.obs;
  var nipUser = "".obs;

  @override
  void onInit() {
    super.onInit();
    getJadwalOnTukarJadwal();
    // getJadwalOnTukarJadwalPihak2();
    getKaryawanPerUnit();
    getAccAtasan();
  }

  Future<void> getJadwalOnTukarJadwal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final nip = prefs.getString('nip');
    nipUser.value = nip ?? "";
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
        Uri.parse("$base_url/tukar-jadwal/jadwal?nip=$nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwalOnTukarJadwalM = JadwalOnTukarJadwalModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> getJadwalOnTukarJadwalPihak2(nip) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // final nip = prefs.getString('nip');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoading2(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/tukar-jadwal/jadwal?nip=$nip"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        jadwalOnTukarJadwalM2 = JadwalOnTukarJadwalModel2.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading2(false);
    }
  }

  Future<void> getKaryawanPerUnit() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
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
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingKarayawan(false);
    }
  }

  Future<void> getAccAtasan() async {
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

      http.Response response = await http.get(
        Uri.parse("$base_url/tukar-jadwal/acc-by-atasan"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        accAtasanM = AccAtasanModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingAcc(false);
    }
  }

  Future<void> postTukarShift(jp1, jp2, nip1, nip2, acc, jenis) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingSubmit(true);
      if (token == null) {
        throw Exception("Token not found");
      }
      Map body = {
        "jadwal_pihak1": jp1,
        "jadwal_pihak2": jp2,
        "nip_pihak1": nip1.toString(),
        "nip_pihak2": nip2.toString(),
        "acc_by": acc.toString(),
        "jenis": jenis,
        "ket": ketController.text,
      };
      http.Response response = await http.post(
        Uri.parse("$base_url/tukar-jadwal"),
        body: jsonEncode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil submit tukar shift");
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingSubmit(false);
    }
  }
}
