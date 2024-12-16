import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:ntp/ntp.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PresensiLemburController extends GetxController {
  RxBool isLoadingPresensiMasuk = false.obs;
  RxBool isLoadingPresensiKeluar = false.obs;

  Rx<DateTime>? ntpTime;
  Rx<DateTime>? initialFetchTime;
  Rx<Timer>? timer;
  RxBool isLoadingTime = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchNtpTime();
  }

  Future<void> presensiLemburLokasi(
    id,
    String jenis,
    latitude,
    longitude,
  ) async {
    print(id);
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    try {
      if (jenis == "MASUK") {
        isLoadingPresensiMasuk(true);
      } else {
        isLoadingPresensiKeluar(true);
      }
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
      if (jenis == "MASUK") {
        isLoadingPresensiMasuk(true);
      } else {
        isLoadingPresensiKeluar(true);
      }
    }
  }

  Future<void> fetchNtpTime() async {
    try {
      DateTime networkTime = await NTP.now();
      ntpTime = networkTime.toLocal().obs;
      // initialFetchTime = DateTime.now().toUtc().obs;
      isLoadingTime(false);
      _startTimer();
    } catch (e) {
      isLoadingTime(false);
      print('Error fetching NTP time: $e');
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ntpTime != null && initialFetchTime != null) {
        ntpTime!.value = initialFetchTime!.value.add(
          Duration(seconds: timer.tick),
        );
      }
    }).obs;
  }
}