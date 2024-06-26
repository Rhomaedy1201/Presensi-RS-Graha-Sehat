import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_cuti.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_keluar_jam_kerja.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_melahirkan.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_pulang_cepat.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_sakit.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_terlambat.dart';
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
  DateTime tglMelahirkan = DateTime.now();
  DateTime tglMulaiSakit = DateTime.now();
  DateTime tglSelesaiSakit = DateTime.now();
  DateTime tglMulaiCuti = DateTime.now();
  DateTime tglSelesaiCuti = DateTime.now();

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

  void callbackIzinMelahirkan(DateTime newDate) {
    tglMelahirkan = newDate;
    setState(() {});
  }

  void callbackIzinSakit(DateTime tglMulai) {
    tglMulaiSakit = tglMulai;
    setState(() {});
  }

  void callbackIzinSakit2(DateTime tglSelesai) {
    tglSelesaiSakit = tglSelesai;
    setState(() {});
  }

  void callbackIzinCuti(DateTime tglMulai) {
    tglMulaiCuti = tglMulai;
    setState(() {});
  }

  void callbackIzinCuti2(DateTime tglSelesai) {
    tglSelesaiCuti = tglSelesai;
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
            onPressed: jenisIzin == null ? null : () {},
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
              if (jenisIzin == '1')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinKeluarJamKerja(
                      callbackSetState: setStateCallbackKeluarJamKerja,
                      jamIzinKeluarJamKerja: jamIzinKeluarJamKerja,
                    ),
                  ],
                )
              else if (jenisIzin == '2')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinPulangCepat(
                      callbackSetState: callbackPulangCepat,
                      jamIzinPulangCepat: jamIzinPulangCepat,
                    ),
                  ],
                )
              else if (jenisIzin == '3')
                Column(
                  children: [
                    spaceHeight(20),
                    const FormIzinTerlambat(),
                  ],
                )
              else if (jenisIzin == '4')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinMelahirkan(
                      callbackSetState: callbackIzinMelahirkan,
                      tglMelahirkan: tglMelahirkan,
                    ),
                  ],
                )
              else if (jenisIzin == '5')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinSakit(
                      callbackSetState: callbackIzinSakit,
                      callbackSetState2: callbackIzinSakit2,
                      tglMulai: tglMulaiSakit,
                      tglSelesai: tglSelesaiSakit,
                    ),
                  ],
                )
              else if (jenisIzin == '6')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinCuti(
                      callbackSetState: callbackIzinCuti,
                      callbackSetState2: callbackIzinCuti2,
                      tglMulai: tglMulaiCuti,
                      tglSelesai: tglSelesaiCuti,
                    ),
                  ],
                )
              else
                Container()
            ],
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
