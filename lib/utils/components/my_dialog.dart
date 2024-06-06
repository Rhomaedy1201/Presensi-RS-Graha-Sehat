import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';

Future<void> dialogComingSoon(nameFeature) {
  return Get.defaultDialog(
    title: "Coming Soon!",
    titleStyle: const TextStyle(
        color: cBlack, fontSize: 18, fontWeight: FontWeight.w600),
    titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
    middleText: "$nameFeature masih dalam tahap pengembangan.",
    textConfirm: "OK",
    backgroundColor: cWhite,
    confirmTextColor: Colors.white,
    buttonColor: cPrimary,
    onConfirm: () {
      Get.back();
    },
  );
}
