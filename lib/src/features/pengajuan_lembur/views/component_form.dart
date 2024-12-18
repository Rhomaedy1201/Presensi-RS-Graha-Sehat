import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/lembur_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_required_text.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class componentsFormLembur extends StatelessWidget {
  LemburController lemburC = Get.find<LemburController>();

  final Function(DateTime) callbackSetStateTgl;
  final Function(DateTime) callbackSetState;
  final Function(DateTime) callbackSetState2;
  final Function(TextEditingController) callbackSetStateKet;
  final Function(String) callbackSetStateFile;
  final Function(String) callbackSetStateJenis;
  final Function(File) callbackSetStateFilePath;
  final Function(DateTime) callBackSetStateTglCheck;
  final Function(DateTime) callBackSetStateMulai;
  final Function(DateTime) callBackSetStateAkhir;
  final Function(Map) callBackSetStateDataSelected;
  DateTime tanggal;
  DateTime tglMulai;
  DateTime tglSelesai;
  TextEditingController pengajuanLemburKet = TextEditingController();
  String? fileName;
  String? jenis;
  File? selectedFile;
  String? tglCheck;
  String? jamMulaiCheck;
  String? jamAkhirCheck;
  Map? dataSelected;
  componentsFormLembur({
    super.key,
    required this.callbackSetStateJenis,
    required this.callbackSetStateTgl,
    required this.callbackSetState,
    required this.callbackSetState2,
    required this.callbackSetStateKet,
    required this.callbackSetStateFile,
    required this.callbackSetStateFilePath,
    required this.callBackSetStateTglCheck,
    required this.callBackSetStateMulai,
    required this.callBackSetStateAkhir,
    required this.callBackSetStateDataSelected,
    required this.jenis,
    required this.tanggal,
    required this.tglMulai,
    required this.tglSelesai,
    required this.pengajuanLemburKet,
    required this.fileName,
    required this.selectedFile,
    required this.tglCheck,
    required this.jamMulaiCheck,
    required this.jamAkhirCheck,
    required this.dataSelected,
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
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: cPrimary,
            shadowColor: cPrimary_400,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ), // Mengatur border radius menjadi 0
            ),
          ),
          onPressed: () {
            if (jenis.isNull ||
                tglCheck.isNull ||
                jamMulaiCheck.isNull ||
                jamAkhirCheck.isNull) {
              snackbarfailed("Harap lengkapi form");
            } else {
              lemburC.postLembur({
                "id": dataSelected!['id'],
                "nama": dataSelected!['nama'],
                "tanggal": tanggal.simpleDate(),
                "mulai": DateTime.parse(jamMulaiCheck.toString()).getTime(),
                "akhir": DateTime.parse(jamAkhirCheck.toString()).getTime(),
                "ket": pengajuanLemburKet.text,
                "file": selectedFile,
              });
            }
          },
          child: Text(
            "Submit Lembur",
            style: customTextStyle(FontWeight.w500, 14, cWhite),
          ),
        ),
      ),
      body: Obx(
        () => lemburC.isLoadingJenis.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        child: Text(
                          "FORM Pengajuan Lembur",
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
                            if (dataSelected != null)
                              if (dataSelected?['ttl_jam'] > 0)
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: cRed,
                                          size: 10,
                                        ),
                                        Text(
                                          "Jenis ",
                                          style: customTextStyle(
                                              FontWeight.w500, 10.3, cRed_700),
                                        ),
                                        Text(
                                          "Dinas ",
                                          style: customTextStyle(
                                              FontWeight.w700, 11, cRed),
                                        ),
                                        Text(
                                          "jam akhir ditambahkan otomatis oleh sistem, ${dataSelected?['ttl_jam']} jam",
                                          style: customTextStyle(
                                              FontWeight.w500, 10.3, cRed_700),
                                        ),
                                      ],
                                    ),
                                    spaceHeight(10),
                                  ],
                                ),
                            dropdownJenis(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tanggal",
                                  style: customTextStyle(
                                      FontWeight.w600, 11, cBlack),
                                ),
                                spaceHeight(5),
                                formtTanggal(context),
                                spaceHeight(10),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      requiredText(
                                          "Mulai", FontWeight.w600, 11, cBlack),
                                      spaceHeight(5),
                                      formJamIzin(context)
                                    ],
                                  ),
                                ),
                                spaceWidth(7),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      requiredText(
                                          "Akhir", FontWeight.w600, 11, cBlack),
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
                            spaceHeight(10),
                            Text(
                              "Jenis lembur di atas membutuhkan absen masuk dan selesai",
                              style:
                                  customTextStyle(FontWeight.w400, 11, cBlack),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Column dropdownJenis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jenis Lembur ",
          style: customTextStyle(FontWeight.w600, 11, cBlack),
        ),
        Container(
          width: Get.width,
          height: 50,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: DropdownButtonFormField<String>(
              hint: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "Pilih pengganti",
                  style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                ),
              ),
              isDense: true,
              isExpanded: true,
              value: jenis,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cGrey_400, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: cGrey_400, width: 1.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                filled: true,
                fillColor: cWhite,
              ),
              onChanged: (String? newValue) {
                jenis = newValue!;
                callbackSetStateJenis(newValue);
              },
              items: lemburC.listJenisLembur
                  .map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['id'].toString(),
                  onTap: () {
                    dataSelected = value;
                    callBackSetStateDataSelected(value);
                    print(dataSelected);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      value['nama'],
                      style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
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

  InkWell formtTanggal(BuildContext context) {
    return InkWell(
      onTap: jenis == null
          ? null
          : () async {
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
                          initialDateTime: tglMulai,
                          // minimumDate: DateTime.now()
                          //     .subtract(const Duration(days: 1)),
                          minimumYear: DateTime.now().year,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (val) {
                            tanggal = val;
                            tglCheck = val.toString();
                            callbackSetStateTgl(val);
                          },
                        ),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () {
                          print(
                            tanggal.dateTime().toString(),
                          );
                          print(tglCheck.toString());
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
                tglCheck == null ? "" : tglMulai.simpleDateRevers(),
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

  InkWell formJamIzin(BuildContext context) {
    return InkWell(
      onTap: (jenis == null || tglCheck == null)
          ? null
          : () async {
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
                          initialDateTime: tglMulai,
                          minimumYear: DateTime.now().year,
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (val) {
                            tglMulai = val;
                            jamMulaiCheck = val.dateTime().toString();
                            callbackSetState(val);
                          },
                        ),
                      ),
                      // Close the modal
                      CupertinoButton(
                        child: const Text('OK'),
                        onPressed: () {
                          if (dataSelected?['ttl_jam'] > 0) {
                            tglSelesai = tglMulai
                                .add(Duration(hours: dataSelected?['ttl_jam']));
                            jamAkhirCheck = tglSelesai.toString();
                            callbackSetState2(tglSelesai);
                            print(tglSelesai);
                          }
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
                jamMulaiCheck == null ? "" : tglMulai.getFullTime(),
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
      onTap: (jenis == null || tglCheck == null || jamMulaiCheck == null)
          ? null
          : (dataSelected?['ttl_jam'] > 0)
              ? null
              : () async {
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
                              initialDateTime: tglSelesai,
                              minimumDate: DateTime.now().subtract(
                                  const Duration(days: 1)), // set minimum date
                              minimumYear: DateTime.now().year,
                              mode: CupertinoDatePickerMode.time,
                              onDateTimeChanged: (val) {
                                tglSelesai = val;
                                jamAkhirCheck = val.toString();
                                callbackSetState2(val);
                              },
                            ),
                          ),
                          // Close the modal
                          CupertinoButton(
                            child: const Text('OK'),
                            onPressed: () {
                              print(tglSelesai.dateTime());
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
                jamAkhirCheck == null ? "" : tglSelesai.getFullTime(),
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
                    controller: pengajuanLemburKet,
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
