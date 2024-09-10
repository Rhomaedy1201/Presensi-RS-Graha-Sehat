import 'dart:io';

import 'package:flutter/material.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/component_form.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';

class PengajuanLembur extends StatefulWidget {
  const PengajuanLembur({super.key});

  @override
  State<PengajuanLembur> createState() => _PengajuanLemburState();
}

class _PengajuanLemburState extends State<PengajuanLembur>
    with TickerProviderStateMixin {
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

  DateTime tanggal = DateTime.now();
  DateTime periodeLembur1 = DateTime.now();
  DateTime periodeLembur2 = DateTime.now();
  TextEditingController pengajuanLemburKet = TextEditingController();
  String? fileNameLembur;
  File? selectedFileLembur;

  // Lembur
  void callbackLemburTgl(DateTime tgl) {
    tanggal = tgl;
    setState(() {});
  }

  void callbackLembur1(DateTime tglMulai) {
    periodeLembur1 = tglMulai;
    setState(() {});
  }

  void callbackLembur2(DateTime tglSelesai) {
    periodeLembur2 = tglSelesai;
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

  void callbackLemburFilePath(File file) {
    selectedFileLembur = file;
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
          child: Text(
            "Submit Lembur",
            style: customTextStyle(FontWeight.w500, 14, cWhite),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: componentsFormLembur(
              callbackSetStateTgl: callbackLemburTgl,
              callbackSetState: callbackLembur1,
              callbackSetState2: callbackLembur2,
              callbackSetStateKet: callbackLemburKet,
              callbackSetStateFile: callbackLemburFile,
              callbackSetStateFilePath: callbackLemburFilePath,
              tanggal: tanggal,
              tglMulai: periodeLembur1,
              tglSelesai: periodeLembur2,
              pengajuanLemburKet: pengajuanLemburKet,
              fileName: fileNameLembur,
              selectedFile: selectedFileLembur,
            ),
          ),
          Text("Progress"),
          Text("Konform"),
          Text("Selesai"),
        ],
      ),
    );
  }
}
