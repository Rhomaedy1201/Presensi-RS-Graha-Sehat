import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class FormIzinMelahirkan extends StatelessWidget {
  final Function(DateTime) callbackSetState;
  DateTime tglMelahirkan;
  FormIzinMelahirkan({
    required this.callbackSetState,
    required this.tglMelahirkan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Text(
              "Form izin Melahirkan",
              style: customTextStyle(FontWeight.w500, 13, cBlack),
            ),
          ),
          Container(
            width: Get.width,
            height: 3,
            color: cGrey_300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tanggal izin",
                      style: customTextStyle(FontWeight.w600, 11, cBlack),
                    ),
                    spaceHeight(5),
                    formJamIzin(context)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  InkWell formJamIzin(BuildContext context) {
    return InkWell(
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
                      tglMelahirkan = val;
                      callbackSetState(val);
                    },
                  ),
                ),
                // Close the modal
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    print(
                      tglMelahirkan.dateTime().toString(),
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
        height: 37,
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
                tglMelahirkan.fullDateAll().toString(),
                style: customTextStyle(FontWeight.w500, 13, cGrey_900),
              ),
              const Icon(
                Icons.date_range_outlined,
                size: 25,
                color: cPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
