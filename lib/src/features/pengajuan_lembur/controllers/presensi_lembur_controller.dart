import 'dart:convert';

import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PresensiLemburController extends GetxController {
  RxBool isLoadingPresensiMasuk = false.obs;

  Future<void> presensiLemburLokasi(
    String id,
    String jenis,
    String latitude,
    String longitude,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      isLoadingPresensiMasuk(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      Map body = {
        "id": id,
        "jenis": jenis,
        "posisi": {
          "lat": latitude,
          "lng": longitude,
        }
      };

      http.Response response = await http.post(
        Uri.parse("$base_url/lembur-absen"),
        headers: headers,
        body: jsonEncode(body),
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        snackbarSuccess("Berhasil presensi lembur");
        Get.offAllNamed(RouteNames.home);
      } else {
        snackbarfailed(json['errors']);
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingPresensiMasuk(false);
    }
  }
}