import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/confirm_lembur_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

Future<void> dialogDeleteLembur(
    title, msg, Future<void> Function() action) async {
  ConfirmLemburController confirmLemburC = Get.find<ConfirmLemburController>();
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
                        text: title,
                        color: cBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    const SizedBox(height: 15),
                    CustomText(
                        text: msg,
                        color: cBlack,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 80,
                      child: TextField(
                        controller: confirmLemburC.textEditingController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Alasan',
                          hintStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: const EdgeInsets.all(12.0),
                        ),
                      ),
                    ),
                    spaceHeight(10),
                    //Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: cPrimary, minimumSize: const Size(0, 45), backgroundColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side: const BorderSide(width: 2, color: cPrimary)),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text(
                              'NO',
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFFFFFFFF), minimumSize: const Size(0, 45), backgroundColor: cPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () async {
                              await action(); // Panggil fungsi
                              Get.back();
                            },
                            child: const Text(
                              'YES',
                            ),
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
