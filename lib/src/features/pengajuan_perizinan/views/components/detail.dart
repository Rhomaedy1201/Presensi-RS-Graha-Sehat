import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class DetailIzin extends StatelessWidget {
  const DetailIzin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Detail Izin"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tgl Pengajuan : 12-01-2024",
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
                          style: customTextStyle(FontWeight.w600, 10, cWhite),
                        ),
                      ),
                    ),
                  ],
                ),
                spaceHeight(10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              image: AssetImage('assets/images/profile.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        spaceWidth(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.7,
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
                spaceHeight(10),
                Text(
                  "Detail:",
                  style: customTextStyle(FontWeight.w500, 11, cBlack),
                ),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: cGrey_400, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tanggal:",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                            spaceHeight(2),
                            Text(
                              "(12-01-2024) - (13-01-2024)",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: cGrey_400,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pengganti:",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                            spaceHeight(2),
                            Text(
                              "SUSANTO, S,Kom (2938237)",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: cGrey_400,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keterangan:",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                            spaceHeight(2),
                            Text(
                              "-",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        height: 1,
                        color: cGrey_400,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bukti:",
                              style:
                                  customTextStyle(FontWeight.w500, 10, cBlack),
                            ),
                            spaceHeight(2),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        width: 300,
                                        height: 300,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/profile.jpg"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.jpg"),
                                  ),
                                ),
                                child: Container(
                                  width: 60,
                                  height: 10,
                                  color: const Color(0x6F000000),
                                  child: Center(
                                    child: Text(
                                      "Lihat\nGambar",
                                      style: customTextStyle(
                                        FontWeight.w600,
                                        11,
                                        cWhite,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                spaceHeight(10),
                Text(
                  "Persetujuan:",
                  style: customTextStyle(FontWeight.w500, 11, cBlack),
                ),
                spaceHeight(8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 17,
                              height: 17,
                              decoration: BoxDecoration(
                                color: cPrimary_800,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.check,
                                  size: 13,
                                  color: cWhite,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 1.7,
                          height: 35,
                          color: cGrey_500,
                        ),
                        Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                            color: cGrey_500,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(),
                        ),
                      ],
                    ),
                    spaceWidth(7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ACC 1 : CHOKY CANDRA",
                          style: customTextStyle(FontWeight.w500, 11, cBlack),
                        ),
                        spaceHeight(35),
                        Text(
                          "ACC SDM : ",
                          style: customTextStyle(FontWeight.w500, 11, cBlack),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
