import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_lain_lain.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_cuti_tahunan.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_melahirkan.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_pulang_cepat.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_sakit.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/form_pengajuan/izin_keluar.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class PerizinanView extends StatefulWidget {
  const PerizinanView({super.key});

  @override
  State<PerizinanView> createState() => _PerizinanViewState();
}

class _PerizinanViewState extends State<PerizinanView> {
  // Cuti Tahuan
  DateTime jamIzinCutiTahunan1 = DateTime.now();
  DateTime jamIzinCutiTahunan2 = DateTime.now();
  String? userIzinCutiTahunan;
  TextEditingController ketIzinCutiTahunan = TextEditingController();
  // Pulang Cepat
  DateTime jamIzinPulangCepat = DateTime.now();
  TextEditingController ketPulangCepat = TextEditingController();
  // Izin Melahirkan
  DateTime tglMelahirkan1 = DateTime.now();
  DateTime tglMelahirkan2 = DateTime.now();
  String? izinMelahirkanUser;
  TextEditingController izinMelahirkanKet = TextEditingController();
  // Izin lain lain
  DateTime tglMulaiLainLain = DateTime.now();
  DateTime tglSelesaiLainLain = DateTime.now();
  String? izinLainLainUser;
  TextEditingController izinLainLainKet = TextEditingController();
  // Izin Sakit
  DateTime tglMulaiSakit = DateTime.now();
  DateTime tglSelesaiSakit = DateTime.now();
  String? izinSakitUser;
  TextEditingController izinSakitKet = TextEditingController();
  String? fileNameSakit;
  // Izin Sakit
  DateTime jamMulaiKeluar = DateTime.now();
  DateTime jamSelesaiKeluar = DateTime.now();
  TextEditingController izinKeluarKet = TextEditingController();
  String? fileNameKeluar;

  String? jenisIzin;
  List pengajuanList = [
    {'id': 1, 'nama': 'IZIN CUTI TAHUNAN'},
    {'id': 2, 'nama': 'IZIN PULANG CEPAT'},
    {'id': 3, 'nama': 'IZIN KELUAR'},
    {'id': 4, 'nama': 'IZIN CUTI MELAHIRKAN'},
    {'id': 5, 'nama': 'IZIN SAKIT'},
    {'id': 6, 'nama': 'IZIN LAIN LAIN'},
  ];

  // Cuti Tahunan
  void setStateCallbackCutiTahunan(DateTime newDate1) {
    jamIzinCutiTahunan1 = newDate1;
    setState(() {});
  }

  void setStateCallbackCutiTahunan2(DateTime newDate2) {
    jamIzinCutiTahunan2 = newDate2;
    setState(() {});
  }

  void setStateCallbackCutiTahunanUser(String user) {
    userIzinCutiTahunan = user;
    setState(() {});
  }

  void setStateCallbackCutiTahunanKet(TextEditingController ket) {
    ketIzinCutiTahunan.text = ket.text;
    setState(() {});
  }

  // Pulang Cepat
  void callbackPulangCepat(DateTime newDate) {
    jamIzinPulangCepat = newDate;
    setState(() {});
  }

  void callbackPulangCepatKet(TextEditingController ket) {
    ketPulangCepat.text = ket.text;
    setState(() {});
  }
  // Izin Melahirkan

  void callbackIzinMelahirkan(DateTime newDate) {
    tglMelahirkan1 = newDate;
    setState(() {});
  }

  void callbackIzinMelahirkan2(DateTime newDate) {
    tglMelahirkan2 = newDate;
    setState(() {});
  }

  void callbackIzinMelahirkanUser(String user) {
    izinMelahirkanUser = user;
    setState(() {});
  }

  void callbackIzinMelahirkanKet(TextEditingController ket) {
    izinMelahirkanKet.text = ket.text;
    setState(() {});
  }

  // Izin lain lain
  void callbackIzinLainLain(DateTime tglMulai) {
    tglMulaiLainLain = tglMulai;
    setState(() {});
  }

  void callbackIzinLainLain2(DateTime tglSelesai) {
    tglSelesaiLainLain = tglSelesai;
    setState(() {});
  }

  void callbackIzinLainLainUser(String user) {
    izinLainLainUser = user;
    setState(() {});
  }

  void callbackIzinLainLainKet(TextEditingController ket) {
    izinLainLainKet.text = ket.text;
    setState(() {});
  }

  // Izin Sakit
  void callbackIzinSakit(DateTime tglMulai) {
    tglMulaiSakit = tglMulai;
    setState(() {});
  }

  void callbackIzinSakit2(DateTime tglSelesai) {
    tglSelesaiSakit = tglSelesai;
    setState(() {});
  }

  void callbackIzinSakitUser(String user) {
    izinSakitUser = user;
    setState(() {});
  }

  void callbackIzinSakitKet(TextEditingController ket) {
    izinSakitKet.text = ket.text;
    setState(() {});
  }

  void callbackIzinSakitFile(String file) {
    fileNameSakit = file;
    setState(() {});
  }

  // Izin Keluar
  void callbackIzinKeluar(DateTime jamMulai) {
    jamMulaiKeluar = jamMulai;
    setState(() {});
  }

  void callbackIzinKeluar2(DateTime jamSelesai) {
    jamSelesaiKeluar = jamSelesai;
    setState(() {});
  }

  void callbackIzinKeluarKet(TextEditingController ket) {
    izinKeluarKet.text = ket.text;
    setState(() {});
  }

  void callbackIzinKeluarFile(String file) {
    fileNameKeluar = file;
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
            onPressed: jenisIzin == null
                ? null
                : () {
                    print(ketIzinCutiTahunan.text);
                  },
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
                    FormIzinCutiTahunan(
                      callbackSetState: setStateCallbackCutiTahunan,
                      callbackSetState2: setStateCallbackCutiTahunan2,
                      callbackSetStateUser: setStateCallbackCutiTahunanUser,
                      callbackSetStateKet: setStateCallbackCutiTahunanKet,
                      jamIzinCutiTahunan1: jamIzinCutiTahunan1,
                      jamIzinCutiTahunan2: jamIzinCutiTahunan2,
                      userPenggantiCutiTahuan: userIzinCutiTahunan,
                      ketIzinCutiTahunan: ketIzinCutiTahunan,
                    ),
                  ],
                )
              else if (jenisIzin == '2')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinPulangCepat(
                      callbackSetState: callbackPulangCepat,
                      callbackSetStateKet: callbackPulangCepatKet,
                      jamIzinPulangCepat: jamIzinPulangCepat,
                      ketPulangCepat: ketPulangCepat,
                    ),
                  ],
                )
              else if (jenisIzin == '3')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinKeluar(
                      callbackSetState: callbackIzinKeluar,
                      callbackSetState2: callbackIzinKeluar2,
                      callbackSetStateKet: callbackIzinKeluarKet,
                      callbackSetStateFile: callbackIzinKeluarFile,
                      jamMulai: jamMulaiKeluar,
                      jamSelesai: jamSelesaiKeluar,
                      izinSakitKet: izinKeluarKet,
                      fileName: fileNameKeluar,
                    ),
                  ],
                )
              else if (jenisIzin == '4')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinMelahirkan(
                      callbackSetState: callbackIzinMelahirkan,
                      callbackSetState2: callbackIzinMelahirkan2,
                      callbackSetStateUser: callbackIzinMelahirkanUser,
                      callbackSetStateKet: callbackIzinMelahirkanKet,
                      tglMelahirkan1: tglMelahirkan1,
                      tglMelahirkan2: tglMelahirkan2,
                      izinMelahirkanUser: izinMelahirkanUser,
                      izinMelahirkanKet: izinMelahirkanKet,
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
                      callbackSetStateUser: callbackIzinSakitUser,
                      callbackSetStateKet: callbackIzinSakitKet,
                      callbackSetStateFile: callbackIzinSakitFile,
                      tglMulai: tglMulaiSakit,
                      tglSelesai: tglSelesaiSakit,
                      izinSakitUser: izinSakitUser,
                      izinSakitKet: izinSakitKet,
                      fileName: fileNameSakit,
                    ),
                  ],
                )
              else if (jenisIzin == '6')
                Column(
                  children: [
                    spaceHeight(20),
                    FormIzinLainLain(
                      callbackSetState: callbackIzinLainLain,
                      callbackSetState2: callbackIzinLainLain2,
                      callbackSetStateUser: callbackIzinLainLainUser,
                      callbackSetStateKet: callbackIzinLainLainKet,
                      tglMulai: tglMulaiLainLain,
                      tglSelesai: tglSelesaiLainLain,
                      izinLainLainUser: izinLainLainUser,
                      izinLainLainKet: izinLainLainKet,
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

  // InkWell fornJanIzinKeluar(BuildContext context) {
  //   return InkWell(
  //     onTap: () async {
  //       showCupertinoModalPopup(
  //         context: context,
  //         builder: (_) => Container(
  //           height: 400,
  //           color: const Color.fromARGB(255, 255, 255, 255),
  //           child: Column(
  //             children: [
  //               SizedBox(
  //                 height: 300,
  //                 child: CupertinoDatePicker(
  //                   initialDateTime: DateTime.now(),
  //                   maximumDate: DateTime.now(),
  //                   maximumYear: DateTime.now().year,
  //                   minimumYear: 2024,
  //                   mode: CupertinoDatePickerMode.time,
  //                   onDateTimeChanged: (val) {
  //                     jamIzinCutiTahunan1 = val;
  //                     setState(() {});
  //                   },
  //                 ),
  //               ),
  //               // Close the modal
  //               CupertinoButton(
  //                 child: const Text('OK'),
  //                 onPressed: () => Navigator.of(context).pop(),
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //     child: Container(
  //       height: 37,
  //       decoration: BoxDecoration(
  //         borderRadius: const BorderRadius.all(
  //           Radius.circular(5),
  //         ),
  //         border: Border.all(color: cGrey_400, width: 1.5),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 12),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               jamIzinCutiTahunan1.getFullTime().toString(),
  //               style: customTextStyle(FontWeight.w500, 13, cGrey_900),
  //             ),
  //             const Icon(
  //               Icons.date_range_outlined,
  //               size: 25,
  //               color: cPrimary,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
