import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class ComponentProgressLembur extends StatefulWidget {
  const ComponentProgressLembur({super.key});

  @override
  State<ComponentProgressLembur> createState() =>
      _ComponentProgressLemburState();
}

class _ComponentProgressLemburState extends State<ComponentProgressLembur> {
  bool showDetail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 350),
              curve: Curves.linear,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: cWhite,
                  boxShadow: const [
                    BoxShadow(
                      color: cGrey_400,
                      blurRadius: 15,
                      offset: Offset(1, 1), // Shadow position
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(top: 15),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.telegram,
                                size: 25,
                                color: cPrimary,
                              ),
                              spaceWidth(7),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                      text: "Muhammad Rhomaedi",
                                      color: cBlack,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  CustomText(
                                      text: "05-11-2024",
                                      color: cPrimary,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                showDetail = !showDetail;
                              });
                            },
                            child: Icon(
                              showDetail
                                  ? Icons.arrow_drop_up_outlined
                                  : Icons.arrow_drop_down_outlined,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      showDetail
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spaceHeight(15),
                                Container(
                                  width: Get.width,
                                  height: 1,
                                  color: cGrey_300,
                                ),
                                spaceHeight(15),
                                CustomText(
                                    text: "Keterangan",
                                    color: cBlack,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                                spaceHeight(5),
                                row1(),
                                spaceHeight(5),
                                row2(),
                                spaceHeight(5),
                                row3(),
                                spaceHeight(5),
                                row4(),
                                spaceHeight(10),
                                CustomText(
                                    text: "Menunggu Persetujuan :",
                                    color: cBlack,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                                spaceHeight(10),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: cGrey_300,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Icon(
                                            Icons.published_with_changes,
                                            size: 20,
                                            color: cPrimary,
                                          ),
                                        ),
                                        Container(
                                          width: 1.5,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: cGrey_300,
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: cGrey_300,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Icon(
                                            Icons.change_circle_outlined,
                                            size: 20,
                                            color: cGrey_900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    spaceWidth(15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: CustomText(
                                              text: "Acc Atasan",
                                              color: cBlack,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                  text:
                                                      "264102017 - CHOKY CHANDRA",
                                                  color: cBlack,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                              CustomText(
                                                  text: "Menunggu Acc",
                                                  color: cBlack,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: CustomText(
                                              text: "Acc Manajemen",
                                              color: cBlack,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                  text:
                                                      "151082016 - ANDREAS., S. Sos",
                                                  color: cBlack,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                              spaceHeight(2),
                                              CustomText(
                                                  text: "Menunggu ACC",
                                                  color: cBlack,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row row1() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Jadwal :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              InkWell(
                onTap: () {
                  debugPrint("Klik Disini");
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: cPrimary,
                    ),
                    CustomText(
                        text: "Klik disini",
                        color: cPrimary,
                        fontSize: 11,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
            ],
          ),
        ),
        spaceWidth(7),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Pengajuan :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text: "07-11-2024 07:00",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row2() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Lembur :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text: "Tindakan",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        spaceWidth(7),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Tanggal :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text: "05-01-2024",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row3() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Waktu :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text: "03:00 - 06:00",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        spaceWidth(7),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Total :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text: "2 Jam 20 menit",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row4() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Absen :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              Container(
                decoration: BoxDecoration(
                  color: cRed,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: CustomText(
                      text: "BLACKDATE",
                      color: cWhite,
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        spaceWidth(7),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                  text: "Keterangan :",
                  color: cGrey_900,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
              spaceHeight(2),
              CustomText(
                  text:
                      "Menjaga jalur listrik server karena padam bergantian, perbaiki komputer radiologi.",
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }
}
