import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsController extends GetxController {
  var isLoading = false.obs;
  var nama = "".obs;
  var jabatan = "".obs;
  var nip = "".obs;
  var role = "".obs;
  var cutiLevel = "".obs;
  var level = "".obs;
  var idJabatan = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPrefs();
  }

  getPrefs() async {
    try {
      isLoading(true);
      final prefs = await SharedPreferences.getInstance();
      nama.value = prefs.getString("nama")!;
      jabatan.value = prefs.getString("nama_jabatan")!;
      nip.value = prefs.getString("nip")!;
      role.value = prefs.getString("role")!;
      cutiLevel.value = prefs.getString("cuti_level")!;
      level.value = prefs.getString("level")!;
      idJabatan.value = prefs.getString("id_jabatan")!;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
