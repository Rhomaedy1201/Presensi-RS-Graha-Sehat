import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/http/models/user_model.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  UserModel? userM;
  TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;
  var isLoadingPass = false.obs;
  var isLoadingImage = false.obs;

  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  Future<void> getUser() async {
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
        Uri.parse("$base_url/user"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        userM = UserModel.fromJson(json);
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> changePassword() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Map body = {
      "password": passwordController.text,
    };
    try {
      isLoadingPass(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.put(
        Uri.parse("$base_url/change-password"),
        headers: headers,
        body: jsonEncode(body),
      );

      // final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Get.back();
        snackbarSuccess("Berhasil ubah password");
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingPass(false);
    }
  }

  Future<void> changeProfile(
    File? file,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingImage(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      var uri = Uri.parse("$base_url/profil-change");
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);

      if (file != null) {
        request.files.add(await http.MultipartFile.fromPath('file', file.path));
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        getUser();
        snackbarSuccess("Berhasil Merubah profile");
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        isLoadingImage(false);
        debugPrint(responseString);
        snackbarfailed("Terjadi Kesalahan.");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingImage(false);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.delete(
        Uri.parse("$base_url/logout"),
        headers: headers,
      );

      if (response.statusCode == 200) {
        Get.offAllNamed(RouteNames.login);
        await prefs.remove('nama');
        await prefs.remove('nip');
        await prefs.remove('role');
        await prefs.remove('token');
        await prefs.remove('id');
        await prefs.remove('id_jabatan');
        await prefs.remove('nama_jabatan');
        await prefs.remove('id_parent');
        await prefs.remove('cuti_level');
        await prefs.remove('level');
        await prefs.clear();
        snackbarSuccess("Berhasil Logout");
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
