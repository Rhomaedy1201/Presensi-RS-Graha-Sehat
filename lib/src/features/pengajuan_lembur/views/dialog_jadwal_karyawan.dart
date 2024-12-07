import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

Future<void> dialogJadwalKaryawan() {
  return Get.dialog(
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 300),
      child: Container(
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: Get.width,
              height: 50,
              decoration: const BoxDecoration(
                  color: cPrimary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "Jadwal Karyawan".tr,
                        color: cBlack,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close, size: 20),
                    )
                  ],
                ),
              ),
            ),
            spaceHeight(10),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            // )
          ],
        ),
      ),
    ),
  );
}
