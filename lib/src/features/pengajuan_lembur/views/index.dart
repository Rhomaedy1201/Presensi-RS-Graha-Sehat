import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/component_confirm.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/component_form.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/component_progress.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/constant.dart';

class PengajuanLembur extends StatefulWidget {
  const PengajuanLembur({super.key});

  @override
  State<PengajuanLembur> createState() => _PengajuanLemburState();
}

class _PengajuanLemburState extends State<PengajuanLembur>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  LemburController lemburC = Get.find<LemburController>();

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

  DateTime tanggal = DateTime.now();
  DateTime periodeLembur1 = DateTime.now();
  DateTime periodeLembur2 = DateTime.now();
  TextEditingController pengajuanLemburKet = TextEditingController();
  String? fileNameLembur;
  String? jenisLembur;
  File? selectedFileLembur;
  String? tglCheck, mulai, akhir;
  Map? dataSelected;
  // Lembur
  void callbackLemburTgl(DateTime tgl) {
    tanggal = tgl;
    tglCheck = tgl.toString();
    setState(() {});
  }

  void callbackLembur1(DateTime tglMulai) {
    periodeLembur1 = tglMulai;
    mulai = tglMulai.toString();
    setState(() {});
  }

  void callbackLembur2(DateTime tglSelesai) {
    periodeLembur2 = tglSelesai;
    akhir = tglSelesai.toString();
    setState(() {});
  }

  void callbackLemburKet(TextEditingController ket) {
    pengajuanLemburKet.text = ket.text;
    setState(() {});
  }

  void callbackLemburFile(String file) {
    fileNameLembur = file;
    setState(() {});
  }

  void callbackLemburJenis(String jenis) {
    jenisLembur = jenis;
    setState(() {});
  }

  void callbackLemburFilePath(File file) {
    selectedFileLembur = file;
    setState(() {});
  }

  void callbackLemburDataSelected(Map data) {
    dataSelected = data;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          "Lembur",
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
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Pengajuan",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Progress",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Selesai",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 10),
                          textAlign: TextAlign.center,
                        ),
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
          componentsFormLembur(
            callbackSetStateJenis: callbackLemburJenis,
            callbackSetStateTgl: callbackLemburTgl,
            callbackSetState: callbackLembur1,
            callbackSetState2: callbackLembur2,
            callbackSetStateKet: callbackLemburKet,
            callbackSetStateFile: callbackLemburFile,
            callbackSetStateFilePath: callbackLemburFilePath,
            callBackSetStateTglCheck: callbackLemburTgl,
            callBackSetStateMulai: callbackLembur1,
            callBackSetStateAkhir: callbackLembur2,
            callBackSetStateDataSelected: callbackLemburDataSelected,
            jenis: jenisLembur,
            tanggal: tanggal,
            tglMulai: periodeLembur1,
            tglSelesai: periodeLembur2,
            pengajuanLemburKet: pengajuanLemburKet,
            fileName: fileNameLembur,
            selectedFile: selectedFileLembur,
            tglCheck: tglCheck,
            jamMulaiCheck: mulai,
            jamAkhirCheck: akhir,
            dataSelected: dataSelected,
          ),
          ComponentProgressLembur(),
          ComponentConfirmLembur(),
          Text("Selesai"),
        ],
      ),
    );
  }
}
