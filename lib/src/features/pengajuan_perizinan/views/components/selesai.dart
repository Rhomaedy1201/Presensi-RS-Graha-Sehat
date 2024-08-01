import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/detail.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class SelesaiIzin extends StatelessWidget {
  const SelesaiIzin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailIzin());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.circular(7),
                boxShadow: const [
                  BoxShadow(
                    color: cGrey_400,
                    blurRadius: 3,
                    offset: Offset(1, 1), // Shadow position
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tgl Pengajuan : 12-01-2024 asss",
                          style: customTextStyle(FontWeight.w500, 11, cBlack),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: cPrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            child: Text(
                              "Izin Sakit (S)",
                              style:
                                  customTextStyle(FontWeight.w600, 10, cWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            spaceWidth(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    "Muhammad Rhomaedi",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                ),
                                spaceHeight(1),
                                Text(
                                  "012377",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cGrey_700),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
