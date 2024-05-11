import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class FormIzinPulangCepat extends StatelessWidget {
  final Function(DateTime) callbackSetState;
  DateTime jamIzinPulangCepat;
  FormIzinPulangCepat({
    required this.callbackSetState,
    required this.jamIzinPulangCepat,
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
              "Form izin Pulang Cepat",
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
                      "Jam izin keluar",
                      style: customTextStyle(FontWeight.w600, 11, cBlack),
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
                                    mode: CupertinoDatePickerMode.time,
                                    onDateTimeChanged: (val) {
                                      jamIzinPulangCepat = val;
                                      callbackSetState(val);
                                    },
                                  ),
                                ),
                                // Close the modal
                                CupertinoButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    print(
                                      jamIzinPulangCepat
                                          .getFullTime()
                                          .toString(),
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
                                jamIzinPulangCepat.getFullTime().toString(),
                                style: customTextStyle(
                                    FontWeight.w500, 13, cGrey_900),
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
                    )
                  ],
                ),
                spaceHeight(10),
                formKeteranganJamIzinKeluar(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column formKeteranganJamIzinKeluar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Keterangan",
          style: customTextStyle(FontWeight.w600, 11, cBlack),
        ),
        spaceHeight(5),
        Container(
          decoration: BoxDecoration(
            color: cWhite,
            border: Border.all(
              width: 1.5,
              color: cGrey_400,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                child: SizedBox(
                  child: TextField(
                    scrollPadding: EdgeInsets.zero,
                    autocorrect: false,
                    maxLines: null,
                    // controller: loginController.passwordController,
                    enableSuggestions: false,
                    style: customTextStyle(
                      FontWeight.w400,
                      11,
                      cBlack,
                    ),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: "Masukkan Keterangan",
                      hintStyle: TextStyle(
                        color: cGrey_700,
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
