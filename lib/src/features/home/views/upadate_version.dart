import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> updatedVersion() async {
  Get.dialog(
    barrierDismissible: false,
    Material(
      type: MaterialType.transparency,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 85),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: 100,
                      child: Image.asset("assets/icons/rocket.png"),
                    ),
                    Positioned(
                        top: -5,
                        right: -5,
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            size: 20,
                          ),
                        ))
                  ],
                ),
                spaceHeight(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(
                        text: "NEW VERSION",
                        color: cPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                    spaceWidth(5),
                    CustomText(
                        text: "1.1.0",
                        color: cGrey_500,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                spaceHeight(5),
                CustomText(
                    text: "Pembaruan Versi 1.1.0",
                    color: cBlack,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
                spaceHeight(8),
                CustomText(
                    text:
                        "- Mengoptimalkan presensi dan tampilan yang menarik atau user frienly",
                    color: cBlack,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
                spaceHeight(12),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse("https://www.instagram.com/rhm3d_/");
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        Get.snackbar('Error', 'Could not launch URL');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Border radius 5
                      ),
                      backgroundColor: cPrimary,
                    ),
                    child: CustomText(
                        text: "Perbarui Sekarang",
                        color: cBlack,
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
