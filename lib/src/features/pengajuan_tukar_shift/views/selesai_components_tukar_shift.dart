import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class SelesaiComponentsTukarShift extends StatefulWidget {
  const SelesaiComponentsTukarShift({super.key});

  @override
  State<SelesaiComponentsTukarShift> createState() =>
      SelesaiComponentsTukarShiftState();
}

class SelesaiComponentsTukarShiftState
    extends State<SelesaiComponentsTukarShift> {
  DateTime tglAwal = DateTime.now();
  DateTime tglAkhir = DateTime.now();
  String? status;
  String? tipePengajuan;
  bool filterShow = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Container(
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
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: formTglAwal(context),
                                ),
                                spaceWidth(10),
                                Expanded(
                                  flex: 1,
                                  child: formTglAkhir(context),
                                ),
                              ],
                            ),
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
                                onPressed: () {},
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
          spaceHeight(10),
          dataCards(),
          spaceHeight(5),
          dataCards(),
        ],
      ),
    );
  }

  Widget dataCards() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.detailPengajuanView);
      },
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      Text(
                        "Muhammad Rhomaedi",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                      spaceHeight(1),
                      Text(
                        "012377",
                        style: customTextStyle(FontWeight.w500, 10, cGrey_700),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cYellow_200,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 1),
                      child: Text(
                        "On Progress",
                        style: customTextStyle(FontWeight.w600, 10, cYellow),
                      ),
                    ),
                  ),
                  spaceHeight(5),
                  Text(
                    "Izin Cuti",
                    style: customTextStyle(FontWeight.w500, 10, cBlack),
                  ),
                ],
              ),
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
          "Tanggal Awal",
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
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumYear: 2024,
                        mode: CupertinoDatePickerMode.date,
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
                    tglAwal.fullDateAll().toString(),
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

  Widget formTglAkhir(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal Akhir",
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
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumYear: 2024,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          tglAkhir = val;
                          setState(() {});
                        },
                      ),
                    ),
                    // Close the modal
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        print(
                          tglAkhir.dateTime().toString(),
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
                    tglAkhir.fullDateAll().toString(),
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
