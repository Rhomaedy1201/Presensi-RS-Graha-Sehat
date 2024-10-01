import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class SppdPage extends StatefulWidget {
  const SppdPage({super.key});

  @override
  State<SppdPage> createState() => _SppdPageState();
}

class _SppdPageState extends State<SppdPage> {
  DateTime tglAwal = DateTime.now();
  String? status;
  String? tipePengajuan;
  bool filterShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Sppd"),
      backgroundColor: cGrey_200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            filter(context),
            spaceHeight(10),
            InkWell(
              onTap: () {},
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: cPrimary,
                            ),
                            child: Center(
                                child: Text("1",
                                    style: customTextStyle(
                                        FontWeight.w600, 15, cWhite))),
                          ),
                          spaceWidth(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "NURUL HIDAYATI,Amd.Kep",
                                style: customTextStyle(
                                    FontWeight.w600, 13, cBlack),
                              ),
                              Text(
                                "UNIT ICU",
                                style: customTextStyle(
                                    FontWeight.w400, 10, cBlack),
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        color: cGrey_400,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Berangkat",
                                  style: customTextStyle(
                                      FontWeight.w400, 10, cBlack),
                                ),
                                Text(
                                  "23-09-2024",
                                  style: customTextStyle(
                                      FontWeight.w600, 12, cBlack),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kembali",
                                  style: customTextStyle(
                                      FontWeight.w400, 10, cBlack),
                                ),
                                Text(
                                  "23-09-2024",
                                  style: customTextStyle(
                                      FontWeight.w600, 12, cBlack),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      spaceHeight(7),
                      Text(
                        "Dinas",
                        style: customTextStyle(FontWeight.w400, 10, cBlack),
                      ),
                      Text(
                        "PERTEMUAN KLINIK DAN TPMD MONITORING DAN EVALUASI PPS",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                      spaceHeight(7),
                      Text(
                        "Tujuan",
                        style: customTextStyle(FontWeight.w400, 10, cBlack),
                      ),
                      Text(
                        "DINKES KAB PROBOLINGGO",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                      spaceHeight(7),
                      Text(
                        "Dibuat",
                        style: customTextStyle(FontWeight.w400, 10, cBlack),
                      ),
                      Text(
                        "11-09-2024 | 07:30",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedSize filter(BuildContext context) {
    return AnimatedSize(
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: customTextStyle(FontWeight.w500, 13, cBlack),
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
                            offset: Offset(1, 1), // Shadow position
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                borderRadius: BorderRadius.circular(
                                  7,
                                ), // Mengatur border radius menjadi 0
                              ),
                            ),
                            onPressed: () {
                              // selesaiTukarShiftC.getSelesai(tglAwal);
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
