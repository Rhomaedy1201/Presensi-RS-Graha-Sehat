import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/konfirmasi.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/progress.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/selesai.dart';
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

class _PerizinanViewState extends State<PerizinanView>
    with TickerProviderStateMixin {
  // Cuti Tahuan
  DateTime tglIzinCutiTahunan1 = DateTime.now();
  DateTime tglIzinCutiTahunan2 = DateTime.now();
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
    tglIzinCutiTahunan1 = newDate1;
    setState(() {});
  }

  void setStateCallbackCutiTahunan2(DateTime newDate2) {
    tglIzinCutiTahunan2 = newDate2;
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

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          "Perizinan",
          style: customTextStyle(FontWeight.w500, 20, cBlack),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Container(
                  decoration: const BoxDecoration(
                    color: cWhite,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: TabBar(
                    onTap: (value) {
                      print("object");
                    },
                    dividerColor: cWhite,
                    unselectedLabelColor: Colors.black,
                    labelColor: cWhite,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: const BoxDecoration(
                      color: cPrimary,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    controller: _tabController,
                    tabs: const <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Pengajuan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                        ),
                      ),
                      Text(
                        "on Progress",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Konfirmasi",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Selesai",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Scaffold(
            backgroundColor: cGrey_200,
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
                          if (jenisIzin == '1') {
                          } else if (jenisIzin == '2') {
                          } else if (jenisIzin == '3') {
                          } else if (jenisIzin == '4') {
                          } else if (jenisIzin == '5') {
                          } else if (jenisIzin == '6') {}
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
            body: Padding(
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (jenisIzin == '1')
                            Column(
                              children: [
                                spaceHeight(20),
                                FormIzinCutiTahunan(
                                  callbackSetState: setStateCallbackCutiTahunan,
                                  callbackSetState2:
                                      setStateCallbackCutiTahunan2,
                                  callbackSetStateUser:
                                      setStateCallbackCutiTahunanUser,
                                  callbackSetStateKet:
                                      setStateCallbackCutiTahunanKet,
                                  jamIzinCutiTahunan1: tglIzinCutiTahunan1,
                                  jamIzinCutiTahunan2: tglIzinCutiTahunan2,
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
                                  callbackSetStateUser:
                                      callbackIzinMelahirkanUser,
                                  callbackSetStateKet:
                                      callbackIzinMelahirkanKet,
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
                                  callbackSetStateUser:
                                      callbackIzinLainLainUser,
                                  callbackSetStateKet: callbackIzinLainLainKet,
                                  tglMulai: tglMulaiLainLain,
                                  tglSelesai: tglSelesaiLainLain,
                                  izinLainLainUser: izinLainLainUser,
                                  izinLainLainKet: izinLainLainKet,
                                ),
                              ],
                            )
                          else
                            Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ProgressIzin(),
          KonfirmasiIzin(),
          SelesaiIzin(),
        ],
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
