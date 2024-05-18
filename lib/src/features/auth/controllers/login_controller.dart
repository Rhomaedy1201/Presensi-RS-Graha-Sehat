import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/http/models/login_model.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController nipController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel? loginM;
  SharedPreferences? prefs;
  var isLoading = false.obs;

  Future<void> login() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      isLoading(true);
      Map body = {
        "nip": nipController.text,
        "password": passwordController.text,
      };
      http.Response response = await http.post(
        Uri.parse("$base_url/login"),
        body: jsonEncode(body),
        headers: headers,
      );
      if (nipController.text == "" || passwordController.text == "") {
        snackbarfailed("Nip atau password tidak boleh kosong.");
      } else {
        final json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          prefs = await SharedPreferences.getInstance();
          loginM = LoginModel.fromJson(json);

          await prefs?.setString('nama', loginM!.data.user.nama);
          await prefs?.setString('nip', loginM!.data.user.nip);
          await prefs?.setString('role', loginM!.data.user.role ?? 'null');
          await prefs?.setString('token', loginM!.data.token);
          await prefs?.setString('nip', loginM!.data.user.jabatans[0].nip);
          await prefs?.setString(
              'id_jabatan', loginM!.data.user.jabatans[0].idJabatan);
          await prefs?.setString('id_jabatan',
              loginM!.data.user.jabatans[0].mJabatan.id.toString());
          await prefs?.setString(
              'nama_jabatan', loginM!.data.user.jabatans[0].mJabatan.nama);
          await prefs?.setString(
              'id_parent', loginM!.data.user.jabatans[0].mJabatan.idParent);
          await prefs?.setString('cuti_level',
              loginM!.data.user.jabatans[0].mJabatan.cutiLevel ?? "null");
          await prefs?.setString(
              'level', loginM!.data.user.jabatans[0].mJabatan.level ?? "null");

          Get.toNamed(RouteNames.home);
          snackbarSuccess("Login Berhasil 👋🏻");

          nipController.clear();
          passwordController.clear();
        } else {
          snackbarfailed("Terjadi kesalahan saat login!.");
        }
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
