import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';

Future<void> dialogDeleteLembur(Future<void> Function() action) async {
  return Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    CustomText(
                        text: "Title Text",
                        color: cBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    const SizedBox(height: 15),
                    CustomText(
                        text: "Message Text",
                        color: cBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    const SizedBox(height: 20),
                    //Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            child: const Text(
                              'NO',
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              primary: Colors.transparent,
                              onPrimary: cPrimary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: BorderSide(width: 2, color: cPrimary)),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            child: const Text(
                              'YES',
                            ),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(0, 45),
                              primary: cPrimary,
                              onPrimary: const Color(0xFFFFFFFF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await action(); // Panggil fungsi
                              Get.back();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
