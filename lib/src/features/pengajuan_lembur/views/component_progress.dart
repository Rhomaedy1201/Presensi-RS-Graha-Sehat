import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/progress_lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/dialog_jadwal_karyawan.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class ComponentProgressLembur extends StatefulWidget {
  const ComponentProgressLembur({super.key});

  @override
  State<ComponentProgressLembur> createState() =>
      _ComponentProgressLemburState();
}

class _ComponentProgressLemburState extends State<ComponentProgressLembur> {
  bool showDetail = false;
  ProgressLemburController progressLemburC =
      Get.find<ProgressLemburController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => progressLemburC.isLoadingGet.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : progressLemburC.isEmptyDataProgress.value
                ? Center(
                    child: Text(
                      "Progress Pengajuan Masih\nKosong!.",
                      textAlign: TextAlign.center,
                      style: customTextStyle(FontWeight.w400, 17, cBlack),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      itemCount: progressLemburC.dataProgress.length ?? 0,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.only(top: 12),
                      itemBuilder: (context, index) {
                        var data = progressLemburC.dataProgress;
                        return AnimatedSize(
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
                            margin: const EdgeInsets.only(top: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        progressLemburC.isActiveList![index] =
                                            !progressLemburC
                                                .isActiveList![index];
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    text: data[index]['nama'],
                                                    color: cBlack,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                CustomText(
                                                    text: DateTime.parse(
                                                            "${data[index]['tanggal']}")
                                                        .simpleDateRevers(),
                                                    color: cPrimary,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500)
                                              ],
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          progressLemburC.isActiveList![index]
                                              ? Icons.arrow_drop_up_outlined
                                              : Icons.arrow_drop_down_outlined,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                  progressLemburC.isActiveList![index]
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                            row1({
                                              "unit": data[index]['id_unit'],
                                              "nama": data[index]['nama'],
                                              "tanggal": DateTime.parse(
                                                      "${data[index]['tanggal']}")
                                                  .simpleDateRevers(),
                                              "shift":
                                                  "(${data[index]['mulai']} - ${data[index]['akhir']})",
                                              "absen":
                                                  data[index]['masuk'] ?? "-",
                                              "pulang":
                                                  data[index]['keluar'] ?? "-",
                                              "ket": data[index]['ket'] ?? "-",
                                              "status": "BELOM",
                                            }, data[index]['created_at']),
                                            spaceHeight(5),
                                            row2(
                                                data[index]['lembur'],
                                                DateTime.parse(
                                                        "${data[index]['tanggal']}")
                                                    .simpleDateRevers()),
                                            spaceHeight(5),
                                            row3(
                                                "${data[index]['mulai']} - ${data[index]['akhir']}",
                                                data[index]['ttl_jam_cast']),
                                            spaceHeight(5),
                                            row4(data[index]['absen'],
                                                data[index]['ket'] ?? "-"),
                                            spaceHeight(10),
                                            CustomText(
                                                text: "Menunggu Persetujuan :",
                                                color: cBlack,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                            spaceHeight(10),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: cGrey_300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: Icon(
                                                        data[index]['acc1_at'] ==
                                                                null
                                                            ? Icons
                                                                .change_circle_outlined
                                                            : Icons
                                                                .published_with_changes,
                                                        size: 20,
                                                        color: data[index][
                                                                    'acc1_at'] ==
                                                                null
                                                            ? cGrey_900
                                                            : cPrimary,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1.5,
                                                      height: 40,
                                                      decoration:
                                                          const BoxDecoration(
                                                        color: cGrey_300,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: cGrey_300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      child: Icon(
                                                        data[index]['acc2_at'] ==
                                                                null
                                                            ? Icons
                                                                .change_circle_outlined
                                                            : Icons
                                                                .published_with_changes,
                                                        size: 20,
                                                        color: data[index][
                                                                    'acc2_at'] ==
                                                                null
                                                            ? cGrey_900
                                                            : cPrimary,
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
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: CustomText(
                                                          text: "ACC Atasan",
                                                          color: cBlack,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomText(
                                                              text:
                                                                  "${data[index]['acc1_by']['nip']} - ${data[index]['acc1_by']['nama']}",
                                                              color: cBlack,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          CustomText(
                                                              text: data[index][
                                                                          'acc1_at'] ==
                                                                      null
                                                                  ? "Menunggu ACC"
                                                                  : "ACC Berhasil",
                                                              color: cBlack,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: CustomText(
                                                          text: "ACC Manajemen",
                                                          color: cBlack,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          CustomText(
                                                              text:
                                                                  "${data[index]['acc2_by']['nip']} - ${data[index]['acc2_by']['nama']}",
                                                              color: cBlack,
                                                              fontSize: 13,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          spaceHeight(2),
                                                          CustomText(
                                                              text: data[index][
                                                                          'acc2_at'] ==
                                                                      null
                                                                  ? "Menunggu ACC"
                                                                  : "ACC Berhasil",
                                                              color: cBlack,
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
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
                        );
                      },
                    )),
      ),
    );
  }

  Row row1(Map dataJadwal, String tglPengajuan) {
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
                  dialogJadwalKaryawan(dataJadwal);
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
                  text: tglPengajuan,
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row2(String tipeLembur, tanggal) {
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
                  text: tipeLembur,
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
                  text: tanggal,
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row3(String waktu, totalJam) {
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
                  text: waktu,
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
                  text: totalJam,
                  color: cBlack,
                  fontSize: 11,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
      ],
    );
  }

  Row row4(absen, ket) {
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
                      text: absen,
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
                  text: ket,
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
