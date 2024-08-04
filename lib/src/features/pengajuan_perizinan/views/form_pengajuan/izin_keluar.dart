import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_required_text.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class FormIzinKeluar extends StatelessWidget {
  final Function(DateTime) callbackSetState;
  final Function(DateTime) callbackSetState2;
  final Function(TextEditingController) callbackSetStateKet;
  final Function(String) callbackSetStateFile;
  final Function(File) callbackSetStateFilePath;
  DateTime jamMulai;
  DateTime jamSelesai;
  TextEditingController izinSakitKet = TextEditingController();
  String? fileName;
  File? selectedFile;
  FormIzinKeluar({
    required this.callbackSetState,
    required this.callbackSetState2,
    required this.callbackSetStateKet,
    required this.callbackSetStateFile,
    required this.callbackSetStateFilePath,
    required this.jamMulai,
    required this.jamSelesai,
    required this.izinSakitKet,
    required this.fileName,
    required this.selectedFile,
  });

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String filePath = result.files.single.path!;
      callbackSetStateFile(result.files.single.name);
      callbackSetStateFilePath(File(filePath));
    }
  }

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
              "FORM IZIN KELUAR",
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
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          requiredText("Mulai", FontWeight.w600, 11, cBlack),
                          spaceHeight(5),
                          formJamIzin(context)
                        ],
                      ),
                    ),
                    spaceWidth(7),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          requiredText("Akhir", FontWeight.w600, 11, cBlack),
                          spaceHeight(5),
                          formJamIzin2(context)
                        ],
                      ),
                    ),
                  ],
                ),
                spaceHeight(10),
                formKeterangan(),
                spaceHeight(10),
                formFile(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget formFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload",
          style: customTextStyle(FontWeight.w600, 11, cBlack),
        ),
        spaceHeight(5),
        GestureDetector(
          onTap: _pickFile,
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: cPrimary, width: 2),
              color: const Color(0xFFF2FFFE),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.upload_file,
                    color: cPrimary,
                    size: 30,
                  ),
                  spaceHeight(5),
                  Text(
                    'Upload file disini...',
                    style: customTextStyle(FontWeight.w500, 13, cPrimary),
                  ),
                  if (fileName != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      'Selected file: $fileName',
                      style: const TextStyle(
                        color: Colors.brown,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
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
                    initialDateTime: jamMulai,
                    minimumDate: DateTime.now()
                        .subtract(const Duration(days: 1)), // set minimum date
                    minimumYear: DateTime.now().year,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (val) {
                      jamMulai = val;
                      callbackSetState(val);
                    },
                  ),
                ),
                // Close the modal
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    print(
                      jamMulai.getFullTime().toString(),
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
                jamMulai.getFullTime().toString(),
                style: customTextStyle(FontWeight.w500, 13, cGrey_900),
              ),
              const Icon(
                Icons.date_range_outlined,
                size: 20,
                color: cPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell formJamIzin2(BuildContext context) {
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
                    initialDateTime: jamSelesai,
                    minimumDate: DateTime.now()
                        .subtract(const Duration(days: 1)), // set minimum date
                    minimumYear: DateTime.now().year,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (val) {
                      jamSelesai = val;
                      callbackSetState2(val);
                    },
                  ),
                ),
                // Close the modal
                CupertinoButton(
                  child: const Text('OK'),
                  onPressed: () {
                    print(
                      jamSelesai.getFullTime().toString(),
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
                jamSelesai.getFullTime().toString(),
                style: customTextStyle(FontWeight.w500, 13, cGrey_900),
              ),
              const Icon(
                Icons.date_range_outlined,
                size: 20,
                color: cPrimary,
              )
            ],
          ),
        ),
      ),
    );
  }

  Column formKeterangan() {
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
                    controller: izinSakitKet,
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
