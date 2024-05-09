import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_datepicker.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  State<JadwalView> createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  DateTime firstDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_100,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          'Jadwal',
          style: customTextStyle(FontWeight.w500, 22, cBlack),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            formFilterTanggal(context),
            spaceHeight(20),
            Text(
              "List Jadwal",
              style: customTextStyle(FontWeight.w600, 14, cBlack),
            ),
            spaceHeight(10),
            cardJadwal(),
            spaceHeight(7),
            cardJadwal(),
            spaceHeight(7),
            cardJadwal(),
          ],
        ),
      ),
    );
  }

  Container cardJadwal() {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(
            color: cGrey_400,
            blurRadius: 7,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Senin",
                  style: customTextStyle(FontWeight.w500, 10, cBlack),
                ),
                spaceHeight(3),
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "11",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                      Text(
                        "Mei",
                        style: customTextStyle(FontWeight.w500, 8, cBlack),
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceWidth(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pagi 3",
                  style: customTextStyle(FontWeight.w600, 12, cPrimary),
                ),
                spaceHeight(3),
                Text(
                  "08:00 WIB -- 15:00 WIB",
                  style: customTextStyle(FontWeight.w600, 15, cBlack),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget formFilterTanggal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Filter",
          style: customTextStyle(FontWeight.w600, 14, cBlack),
        ),
        spaceHeight(5),
        InkWell(
          onTap: () async {
            if (GetPlatform.isAndroid) {
              final date = await datePicker(context, DateTime.now());
              if (mounted) {
                setState(() {
                  firstDate = date ?? DateTime.now();
                });
              }
            } else if (GetPlatform.isIOS) {
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
                          mode: CupertinoDatePickerMode.monthYear,
                          onDateTimeChanged: (val) {
                            setState(() {
                              firstDate = val;
                            });
                          },
                        ),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () => Navigator.of(context).pop(),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          child: Container(
            height: 40,
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
                  Text(firstDate.getMonthAndYear().toString()),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 25,
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
