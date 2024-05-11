import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_keluar_jam_kerja.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_pulang_cepat.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class PerizinanView extends StatefulWidget {
  const PerizinanView({super.key});

  @override
  State<PerizinanView> createState() => _PerizinanViewState();
}

class _PerizinanViewState extends State<PerizinanView> {
  DateTime jamIzinKeluarJamKerja = DateTime.now();
  DateTime jamIzinPulangCepat = DateTime.now();
  String? jenisIzin;
  List pengajuanList = [
    {'id': 1, 'nama': 'Izin keluar pada jam kerja'},
    {'id': 2, 'nama': 'Izin pulang cepat'},
    {'id': 3, 'nama': 'Izin terlambat'},
    {'id': 4, 'nama': 'Cuti melahirkan'},
    {'id': 5, 'nama': 'Izin sakit'},
    {'id': 6, 'nama': 'Izin cuti'},
  ];

  void setStateCallbackKeluarJamKerja(DateTime newDate) {
    jamIzinKeluarJamKerja = newDate;
    setState(() {});
  }

  void callbackPulangCepat(DateTime newDate) {
    jamIzinPulangCepat = newDate;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Pengajuan Izin"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SizedBox(
          width: Get.width,
          height: 40,
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
            onPressed: () {},
            child: const Text(
              "Submit Pengajuan",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: cWhite,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Expanded(
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
                            horizontal: 15, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            dropdownJenisIzin(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                spaceHeight(20),
                FormIzinKeluarJamKerja(
                  callbackSetState: setStateCallbackKeluarJamKerja,
                  jamIzinKeluarJamKerja: jamIzinKeluarJamKerja,
                ),
                spaceHeight(10),
                FormIzinPulangCepat(
                  callbackSetState: callbackPulangCepat,
                  jamIzinPulangCepat: jamIzinPulangCepat,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell fornJanIzinKeluar(BuildContext context) {
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
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (val) {
                      jamIzinKeluarJamKerja = val;
                      setState(() {});
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
                jamIzinKeluarJamKerja.getFullTime().toString(),
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

  Column dropdownJenisIzin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jenis Izin",
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
                  "Pilih izin",
                  style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                ),
              ),
              isDense: true,
              isExpanded: true,
              value: jenisIzin,
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
                setState(() {
                  jenisIzin = newValue!;
                });
              },
              items: pengajuanList.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['id'].toString(),
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
}
