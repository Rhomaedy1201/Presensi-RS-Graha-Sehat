import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/selesai_tukar_jadwal_model.dart';
import 'package:http/http.dart' as http;
import 'package:presensi_gs/utils/base_url.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelesaiTukarShiftController extends GetxController {
  SelesaiTukarJadwalModel? selesaiTukarJadwalM;

  var isLoading = false.obs;
  var isEmptyData = true.obs;
  List<bool>? isActiveList;

  @override
  void onInit() {
    super.onInit();
    getSelesai(DateTime.now());
  }

  Future<void> getSelesai(DateTime tgl) async {
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
            "$base_url/tukar-jadwal/history?month=${tgl.getMonthNumber()}&year=${tgl.getYear()}"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var data = json['data'];
        selesaiTukarJadwalM = SelesaiTukarJadwalModel.fromJson(json);
        if (data.length > 0) {
          isActiveList = List.generate(
            selesaiTukarJadwalM?.data.length ?? 0,
            (index) => false,
          );
          isEmptyData(false);
        } else {
          isEmptyData(true);
        }
      } else {
        debugPrint(response.body.toString());
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
