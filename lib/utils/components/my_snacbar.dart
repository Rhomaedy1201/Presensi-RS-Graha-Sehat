import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';

snackbarfailed(var msg) {
  return Get.snackbar(
    "Gagal!",
    "message",
    backgroundColor: cGrey_300,
    duration: const Duration(seconds: 3),
    colorText: cRed_900,
    messageText: Text(
      msg,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}

snackbarSuccess(var msg) {
  return Get.snackbar(
    "Berhasil",
    "message",
    backgroundColor: cGrey_300,
    duration: const Duration(seconds: 3),
    colorText: cPrimary_800,
    messageText: Text(
      msg,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
    ),
  );
}
