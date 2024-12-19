import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/selesai_lembur_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class ComponentSelesaiLembur extends StatefulWidget {
  const ComponentSelesaiLembur({super.key});

  @override
  State<ComponentSelesaiLembur> createState() => _ComponentSelesaiLemburState();
}

class _ComponentSelesaiLemburState extends State<ComponentSelesaiLembur> {
  SelesaiLemburController selesaiLemburC = Get.find<SelesaiLemburController>();
  DateTime tglAwal = DateTime.now();
  bool filterShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => selesaiLemburC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.linear,
                      child: Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: cWhite,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: cGrey_400,
                              blurRadius: 15,
                              offset: Offset(1, 1), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Filter",
                                    style: customTextStyle(
                                        FontWeight.w500, 13, cBlack),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      filterShow = !filterShow;
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: cWhite,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: cGrey_400,
                                            blurRadius: 7,
                                            offset:
                                                Offset(1, 1), // Shadow position
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Icon(
                                        filterShow
                                            ? Icons.arrow_drop_up
                                            : Icons.arrow_drop_down_sharp,
                                        size: 25,
                                        color: cBlack,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            !filterShow
                                ? Container()
                                : Container(
                                    width: Get.width,
                                    height: 3,
                                    color: cGrey_300,
                                  ),
                            !filterShow
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        formTglAwal(context),
                                        spaceHeight(10),
                                        SizedBox(
                                          width: Get.width,
                                          height: 35,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: cPrimary,
                                              shadowColor: cPrimary_400,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ), // Mengatur border radius menjadi 0
                                              ),
                                            ),
                                            onPressed: () {
                                              selesaiLemburC
                                                  .getDataSelesai(tglAwal);
                                            },
                                            child: const Text(
                                              "Filter",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                                color: cWhite,
                                              ),
                                            ),
                                          ),
                                        ),
                                        spaceHeight(3)
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    spaceHeight(10),
                    selesaiLemburC.isEmptyDataSelesai.value
                        ? Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 100),
                              child: Text(
                                "Pengajuan Selesai\nPada bulan ${tglAwal.getMonthAndYear()}\nMasih Kosong!.",
                                textAlign: TextAlign.center,
                                style: customTextStyle(
                                    FontWeight.w400, 17, cBlack),
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: selesaiLemburC.dataSelesai.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var data = selesaiLemburC.dataSelesai;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: cWhite,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: cGrey_400,
                                        blurRadius: 15,
                                        offset: Offset(1, 1), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 25,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      color: cPrimary),
                                                  child: Center(
                                                    child: CustomText(
                                                        text: "${index +1}",
                                                        color: cWhite,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                spaceWidth(10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: data[index]['nama'],
                                                        color: cBlack,
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    CustomText(
                                                        text:
                                                            "${data[index]['m_unit']['nama']}",
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ],
                                                )
                                              ],
                                            ),
                                            // if (data[index]['masuk'] == null ||
                                            //     data[index]['keluar'] == null)
                                            //   InkWell(
                                            //     onTap: () {
                                            //       if (data[index]['absen'] == "FOTO") {
                                            //         Get.toNamed(RouteNames.cameraLembur,
                                            //         arguments: {
                                            //               "id": data[index]['id'],
                                            //               "absen": data[index]['masuk'] == null ? "Masuk" : "Pulang",
                                            //             });
                                            //       } else {
                                            //         Get.toNamed(RouteNames.presensiLocationLembur);
                                            //       }
                                            //       // if (data[index]['absen'] == "FOTO") {
                                            //       //   Get.toNamed(RouteNames.cameraLembur,
                                            //       //   arguments: {
                                            //       //     "id": selesaiLemburC.dataPresensiHarian['lembur']['id'],
                                            //       //     "absen": selesaiLemburC.dataPresensiHarian['lembur']['absen'] == null ? "Masuk" : "Pulang",
                                            //       //   });
                                            //       // } else {
                                            //       //   Get.toNamed(RouteNames.presensiLocationLembur,
                                            //       //   arguments: {
                                            //       //     "lembur": selesaiLemburC.dataPresensiHarian['lembur']  
                                            //       //   });
                                            //       // }
                                            //     },
                                            //     child: Container(
                                            //       decoration: BoxDecoration(
                                            //           border: Border.all(
                                            //               width: 1,
                                            //               color: cPrimary),
                                            //           borderRadius:
                                            //               BorderRadius.circular(
                                            //                   5)),
                                            //       child: Padding(
                                            //         padding: const EdgeInsets
                                            //             .symmetric(
                                            //             horizontal: 7,
                                            //             vertical: 3),
                                            //         child: CustomText(
                                            //             text: "Presensi",
                                            //             color: cPrimary,
                                            //             fontSize: 11,
                                            //             fontWeight:
                                            //                 FontWeight.w500),
                                            //       ),
                                            //     ),
                                            //   ),
                                              if(data[index]['masuk'] != null && data[index]['keluar'] != null)
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: const Color(0x640ED654),
                                                    // border: Border.all(width: 1.5, color: cPrimary),
                                                    borderRadius: BorderRadius.circular(5)),
                                                child: Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 4),
                                                  child: CustomText(
                                                      text: "Selesai",
                                                      color: cPrimary_dark,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w700),
                                                ),
                                              )
                                          ],
                                        ),
                                        spaceHeight(10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Tanggal :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    CustomText(
                                                        text: DateTime.parse(
                                                                data[index]
                                                                    ['tanggal'])
                                                            .simpleDateRevers(),
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Mulai :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    CustomText(
                                                        text: data[index]
                                                            ['mulai'],
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Akhir :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    CustomText(
                                                        text: data[index]
                                                            ['akhir'],
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        spaceHeight(10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Tipe Absen :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                3),
                                                        color: const Color(
                                                            0xFF8AE5F7),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                2),
                                                        child: CustomText(
                                                            text:
                                                                "PRESENSI ${data[index]['absen']}",
                                                            color: cBlack,
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight.w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: data[index]['absen'] == "FOTO" ? 1 : 2,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Status Presensi :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    CustomText(
                                                        text: data[index]['masuk'] != null ? data[index]['keluar'] != null ? "Pulang" : "Masuk" : "-",
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                              if(data[index]['absen'] == "FOTO")
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Hasil Foto :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    (data[index]['masuk'] != null && data[index]['absen'] == "FOTO") ?
                                                    InkWell(
                                                      onTap: () {
                                                        Get.dialog(Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(
                                                              horizontal: 50,
                                                              vertical: 200),
                                                          child: Stack(
                                                            clipBehavior: Clip.none,
                                                            children: [
                                                              SizedBox(
                                                                child: Image.network(
                                                                    data[index][
                                                                        'bukti_url_cast'],
                                                                    fit: BoxFit.cover),
                                                              ),
                                                              Positioned(
                                                                right: 5,
                                                                top: 5,
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    Get.back();
                                                                  },
                                                                  child: Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: cWhite,
                                                                        borderRadius:
                                                                            BorderRadius
                                                                                .circular(
                                                                                    5),
                                                                        border: Border.all(
                                                                            width: 1,
                                                                            color:
                                                                                cBlack),
                                                                      ),
                                                                      child: const Icon(
                                                                          Icons.close)),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ));
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(width: 1, color: cPrimary),
                                                            borderRadius: BorderRadius.circular(5)),
                                                        child: Padding(
                                                          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 1),
                                                          child: CustomText(
                                                              text: "Lihat Foto",
                                                              color: cPrimary,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight.w500),
                                                        ),
                                                      ),
                                                    ) : CustomText(
                                                        text: "-",
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        spaceHeight(10),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 35),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomText(
                                                        text: "Keterangan :",
                                                        color: cBlack,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    CustomText(
                                                        text: data[index]
                                                                ['ket'] ??
                                                            "-",
                                                        color: cBlack,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          )
                  ],
                ),
              ),
      ),
    );
  }

  Widget formTglAwal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal",
          style: customTextStyle(FontWeight.w500, 11, cBlack),
        ),
        spaceHeight(5),
        InkWell(
          onTap: () async {
            showCupertinoModalPopup(
              context: context,
              builder: (_) => Container(
                height: 400,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    SizedBox(
                      height: 300,
                      child: CupertinoDatePicker(
                        initialDateTime: tglAwal,
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumYear: 2024,
                        mode: CupertinoDatePickerMode.monthYear,
                        onDateTimeChanged: (val) {
                          tglAwal = val;
                          setState(() {});
                        },
                      ),
                    ),
                    // Close the modal
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        print(
                          tglAwal.dateTime().toString(),
                        );
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            );
          },
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(color: cGrey_400, width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tglAwal.getMonthAndYear().toString(),
                    style: customTextStyle(FontWeight.w500, 12, cGrey_900),
                  ),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 22,
                    color: cPrimary,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
