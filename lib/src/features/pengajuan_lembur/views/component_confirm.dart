import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/confirm_lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/dialog_delete_lembur.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/dialog_jadwal_karyawan.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class ComponentConfirmLembur extends StatefulWidget {
  const ComponentConfirmLembur({super.key});

  @override
  State<ComponentConfirmLembur> createState() => _ComponentConfirmLemburState();
}

class _ComponentConfirmLemburState extends State<ComponentConfirmLembur> {
  bool showDetail = false;
  ConfirmLemburController confirmLemburC = Get.find<ConfirmLemburController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => confirmLemburC.isLoadingGet.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : confirmLemburC.isEmptyDataConfirm.value
                ? Center(
                    child: Text(
                      "Confirmasi Pengajuan Masih\nKosong!.",
                      textAlign: TextAlign.center,
                      style: customTextStyle(FontWeight.w400, 17, cBlack),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RefreshIndicator(
                      onRefresh: () => confirmLemburC.getDataConfirm(),
                      child: ListView.builder(
                        itemCount: confirmLemburC.dataConfirm.length ?? 0,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.only(top: 12),
                        itemBuilder: (context, index) {
                          var data = confirmLemburC.dataConfirm;
                          
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
                                          confirmLemburC.isActiveList![index] =
                                              !confirmLemburC
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
                                            confirmLemburC.isActiveList![index]
                                                ? Icons.arrow_drop_up_outlined
                                                : Icons.arrow_drop_down_outlined,
                                            size: 30,
                                          )
                                        ],
                                      ),
                                    ),
                                    confirmLemburC.isActiveList![index]
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
                                              if((confirmLemburC.nip.value == data[index]['acc1_by']['nip']) || (confirmLemburC.nip.value == data[index]['acc2_by']['nip']))
                                              if(((confirmLemburC.nip.value == data[index]['acc1_by']['nip']) && (data[index]['acc1_at'] == null)) || ((confirmLemburC.nip.value == data[index]['acc2_by']['nip']) && (data[index]['acc1_at'] != null)))
                                              // if((confirmLemburC.nip.value == data[index]['acc1_by']['nip'])  && (data[index]['acc1_at'] == null))
                                              // if ((confirmLemburC.nip.value == data[index]['acc2_by']['nip']) && data[index]['acc1_at'] != null)
                                              //   if (((confirmLemburC.nip.value == data[index]['acc1_by']['nip']) && (data[index]['acc1_at'] == null)) ||
                                              //       ((confirmLemburC.nip.value == data[index]['acc2_by']['nip']) && (data[index]['acc2_at'] == null)))
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    spaceHeight(5),
                                                    if (confirmLemburC
                                                            .nip.value ==
                                                        data[index]['acc1_by']
                                                            ['nip'])
                                                      CustomText(
                                                          text: "Sebagai ACC 1",
                                                          color: cBlack,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    if (confirmLemburC
                                                            .nip.value ==
                                                        data[index]['acc2_by']
                                                            ['nip'])
                                                      CustomText(
                                                          text: "Sebagai ACC 2",
                                                          color: cBlack,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    spaceHeight(10),
                                                    Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 30,
                                                          width:
                                                              Get.width * 0.28,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              elevation: 0,
                                                              shadowColor:
                                                                  cPrimary,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side: const BorderSide(
                                                                    color:
                                                                        cPrimary,
                                                                    width: 2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  5,
                                                                ),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              // AKSI ACC PENGAJUAN LEMBUR
                                                              if (confirmLemburC
                                                                      .nip
                                                                      .value ==
                                                                  data[index][
                                                                          'acc1_by']
                                                                      ['nip']) {
                                                                confirmLemburC
                                                                    .accConfirm(
                                                                        "acc1",
                                                                        data[index]
                                                                            [
                                                                            'id']);
                                                              } else if (confirmLemburC
                                                                      .nip
                                                                      .value ==
                                                                  data[index][
                                                                          'acc2_by']
                                                                      ['nip']) {
                                                                confirmLemburC
                                                                    .accConfirm(
                                                                        "acc2",
                                                                        data[index]
                                                                            [
                                                                            'id']);
                                                              }
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .check_circle,
                                                                    color:
                                                                        cPrimary,
                                                                    size: 13),
                                                                spaceWidth(5),
                                                                Text(
                                                                  "Terima",
                                                                  style: customTextStyle(
                                                                      FontWeight
                                                                          .w500,
                                                                      12,
                                                                      cPrimary),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        spaceWidth(5),
                                                        SizedBox(
                                                          height: 30,
                                                          width:
                                                              Get.width * 0.28,
                                                          child: ElevatedButton(
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              elevation: 0,
                                                              shadowColor: cRed,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side:
                                                                    const BorderSide(
                                                                        color:
                                                                            cRed,
                                                                        width:
                                                                            2),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                  5,
                                                                ),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Future<void>
                                                                  aksiTolak() async {
                                                                confirmLemburC.tolakConfirm(
                                                                    data[index]
                                                                        ['id'],
                                                                    confirmLemburC
                                                                        .textEditingController
                                                                        .text);
                                                              }
                    
                                                              dialogDeleteLembur(
                                                                  "Warning!",
                                                                  "Apakah anda ingin menolak pengajuan ini?",
                                                                  aksiTolak);
                                                            },
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .cancel,
                                                                    color: cRed,
                                                                    size: 13),
                                                                spaceWidth(5),
                                                                Text(
                                                                  "Tolak",
                                                                  style: customTextStyle(
                                                                      FontWeight
                                                                          .w500,
                                                                      12,
                                                                      cRed),
                                                                ),
                                                              ],
                                                            ),
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
                      ),
                    ),),
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
