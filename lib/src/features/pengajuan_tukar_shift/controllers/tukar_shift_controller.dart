import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/jadwal_on_tukar_jadwal.dart';
import 'package:presensi_gs/http/models/jadwal_on_tukar_jadwal2.dart';
import 'package:presensi_gs/http/models/karyawan_per_unit_model.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TukarJadwalController extends GetxController {
  JadwalOnTukarJadwalModel? jadwalOnTukarJadwalM;
  JadwalOnTukarJadwalModel2? jadwalOnTukarJadwalM2;
  KaryawanPerUnitModel? karyawanPerUnitM;
  var isLoading = false.obs;
  var isLoading2 = false.obs;
  var isLoadingKarayawan = false.obs;

  @override
  void onInit() {
    super.onInit();
    getJadwalOnTukarJadwal();
    // getJadwalOnTukarJadwalPihak2();
    getKaryawanPerUnit();
  }

  Future<void> getJadwalOnTukarJadwal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final nip = prefs.getString('nip');
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
        print(json);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingKarayawan(false);
    }
  }
}
