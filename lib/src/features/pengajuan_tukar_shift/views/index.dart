import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/tukar_shift_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/views/confirm_components_tukar_shift.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/views/progress_components_tukar_shift.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/views/selesai_components_tukar_shift.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_required_text.dart';
import 'package:presensi_gs/utils/components/my_shoten_last_name.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class TukarShiftView extends StatefulWidget {
  const TukarShiftView({super.key});

  @override
  State<TukarShiftView> createState() => _TukarShiftViewState();
}

class _TukarShiftViewState extends State<TukarShiftView>
    with TickerProviderStateMixin {
  PrefsController prefsC = Get.find<PrefsController>();
  TukarJadwalController tukarJadwalC = Get.find<TukarJadwalController>();

  String? valJenis = '1';
  String? valJadwalShift1;
  String? valJadwalShift2;
  String? valKaryawan;

  final List listJenis = [
    {'id': '1', 'name': 'TUKAR SHIFT'},
    {'id': '2', 'name': 'TUKAR OFF 1 (TAMBAH)'},
    // {'id': '3', 'name': 'TUKAR OFF 2 (HAPUS)'}
  ];

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
          "Tukar Shift",
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
          Obx(
            () => Scaffold(
              body: tukarJadwalC.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "*",
                                    style: customTextStyle(
                                        FontWeight.w800, 13, cRed),
                                  ),
                                  spaceWidth(5),
                                  Text(
                                    "Jadwal yang di ambil berdasarkan bulan ini",
                                    style: customTextStyle(
                                        FontWeight.w500, 11, cBlack),
                                  ),
                                ],
                              ),
                              spaceHeight(10),
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
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "Tipe Pengajuan",
                                        style: customTextStyle(
                                            FontWeight.w500, 13, cBlack),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: 3,
                                      color: cGrey_300,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          dropdownTipe(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              spaceHeight(3),
                              const Center(
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 27,
                                  color: cPrimary,
                                ),
                              ),
                              spaceHeight(3),
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
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "Pihak Pertama",
                                        style: customTextStyle(
                                            FontWeight.w500, 13, cBlack),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: 3,
                                      color: cGrey_300,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          formUser1(
                                            context,
                                            prefsC.isLoading.value
                                                ? "...."
                                                : prefsC.nip.value,
                                            prefsC.isLoading.value
                                                ? "...."
                                                : prefsC.nama.value,
                                          ),
                                          spaceHeight(10),
                                          dropdownShift1(tukarJadwalC),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              spaceHeight(5),
                              const Center(
                                child: Icon(
                                  Icons.swap_vert_outlined,
                                  size: 25,
                                  color: cPrimary,
                                ),
                              ),
                              spaceHeight(5),
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
                                        horizontal: 15,
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "Pihak Kedua",
                                        style: customTextStyle(
                                            FontWeight.w500, 13, cBlack),
                                      ),
                                    ),
                                    Container(
                                      width: Get.width,
                                      height: 3,
                                      color: cGrey_300,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (valJenis == "1")
                                            Column(
                                              children: [
                                                dropdownKaryawan(),
                                                spaceHeight(2),
                                                dropdownShift2(),
                                              ],
                                            ),
                                          if (valJenis == "2")
                                            Column(
                                              children: [
                                                ketTukarOff1(),
                                                spaceHeight(10),
                                                dropdownKaryawan(),
                                              ],
                                            ),
                                          // if (valJenis == "3")
                                          //   Column(
                                          //     children: [
                                          //       ketTukarOff2(),
                                          //       spaceHeight(10),
                                          //       dropdownKaryawan(),
                                          //     ],
                                          //   ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              spaceHeight(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ACC Atasan",
                                    style: customTextStyle(
                                        FontWeight.w600, 11, cBlack),
                                  ),
                                  spaceHeight(5),
                                  Container(
                                    height: 38,
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                      color: cGrey_200,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(5),
                                      ),
                                      border: Border.all(
                                          color: cGrey_400, width: 1.5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            tukarJadwalC.isLoadingAcc.value
                                                ? "..."
                                                : "(${tukarJadwalC.accAtasanM?.data.nip}) - ${tukarJadwalC.accAtasanM?.data.nama}",
                                            style: customTextStyle(
                                                FontWeight.w500, 13, cGrey_900),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  spaceHeight(10),
                                  Text(
                                    "Keterangan",
                                    style: customTextStyle(
                                        FontWeight.w600, 11, cBlack),
                                  ),
                                  spaceHeight(5),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: cGrey_400,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            autocorrect: false,
                                            maxLines: 1,
                                            controller:
                                                tukarJadwalC.ketController,
                                            enableSuggestions: false,
                                            style: customTextStyle(
                                                FontWeight.w400, 12, cBlack),
                                            decoration: const InputDecoration(
                                              hintText: "Keterangan",
                                              hintStyle: TextStyle(
                                                color: cGrey_700,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              border: InputBorder.none,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              bottomNavigationBar: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    onPressed: tukarJadwalC.isLoadingSubmit.value
                        ? null
                        : () {
                            if (valJadwalShift1 == null) {
                              snackbarfailed(
                                  "Jadwal Shift pihak pertama wajib di isi!");
                            } else {
                              if (valKaryawan == null) {
                                snackbarfailed(
                                    "Nama pihak kedua wajib di isi!");
                              } else {
                                if (valJenis == '1') {
                                  if (valJadwalShift2 == null) {
                                    snackbarfailed(
                                        "Jadwal Shift pihak kedua wajib di isi!");
                                  } else {
                                    tukarJadwalC.postTukarShift(
                                      valJadwalShift1,
                                      valJadwalShift2,
                                      prefsC.nip.value,
                                      valKaryawan,
                                      tukarJadwalC.accAtasanM!.data.nip,
                                      valJenis,
                                    );
                                  }
                                } else {
                                  tukarJadwalC.postTukarShift(
                                    valJadwalShift1,
                                    valJadwalShift2,
                                    prefsC.nip.value,
                                    valKaryawan,
                                    tukarJadwalC.accAtasanM!.data.nip,
                                    valJenis,
                                  );
                                }
                              }
                            }
                          },
                    child: tukarJadwalC.isLoadingSubmit.value
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Submit Tukar Shift",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: cWhite,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          ProgressComponentsTukarShift(),
          ConfirmComponentsTukarShift(),
          SelesaiComponentsTukarShift(),
        ],
      ),
    );
  }

  Widget ketTukarOff1() {
    return Column(
      children: [
        Row(
          children: [
            Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black)),
            spaceWidth(4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Jadwal ",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                  TextSpan(
                    text: "PIHAK 1",
                    style: customTextStyle(FontWeight.w600, 10, Colors.red),
                  ),
                  TextSpan(
                    text: " menjadi libur",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                ],
              ),
            ),
          ],
        ),
        spaceHeight(5),
        Row(
          children: [
            Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black)),
            spaceWidth(4),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Jadwal kerja ",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                  TextSpan(
                    text: "PIHAK 1",
                    style: customTextStyle(FontWeight.w600, 10, Colors.red),
                  ),
                  TextSpan(
                    text: " akan di tambahkan atau di gantikan ",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                  TextSpan(
                    text: "PIHAK 2",
                    style: customTextStyle(FontWeight.w600, 10, Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Widget ketTukarOff2() {
  //   return Column(
  //     children: [
  //       Row(
  //         children: [
  //           Container(
  //               width: 4,
  //               height: 4,
  //               decoration: const BoxDecoration(
  //                   shape: BoxShape.circle, color: Colors.black)),
  //           spaceWidth(4),
  //           RichText(
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: "Jadwal ",
  //                   style: customTextStyle(FontWeight.w600, 10, cBlack),
  //                 ),
  //                 TextSpan(
  //                   text: "PIHAK 1",
  //                   style: customTextStyle(FontWeight.w600, 10, Colors.red),
  //                 ),
  //                 TextSpan(
  //                   text: " menjadi libur",
  //                   style: customTextStyle(FontWeight.w600, 10, cBlack),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //       spaceHeight(5),
  //       Row(
  //         children: [
  //           Container(
  //               width: 4,
  //               height: 4,
  //               decoration: const BoxDecoration(
  //                   shape: BoxShape.circle, color: Colors.black)),
  //           spaceWidth(4),
  //           RichText(
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: "Jadwal kerja ",
  //                   style: customTextStyle(FontWeight.w600, 10, cBlack),
  //                 ),
  //                 TextSpan(
  //                   text: "PIHAK 1",
  //                   style: customTextStyle(FontWeight.w600, 10, Colors.red),
  //                 ),
  //                 TextSpan(
  //                   text: " dan jadwal ",
  //                   style: customTextStyle(FontWeight.w600, 10, cBlack),
  //                 ),
  //                 TextSpan(
  //                   text: "PIHAK 2 ",
  //                   style: customTextStyle(FontWeight.w600, 10, Colors.red),
  //                 ),
  //                 TextSpan(
  //                   text: " otomatis tergantikan ",
  //                   style: customTextStyle(FontWeight.w600, 10, cBlack),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Padding commingSoon() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 50 + 130,
        bottom: 25,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: Get.width,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                "Comming  Soon...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column dropdownTipe() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredText("Jenis", FontWeight.w600, 11, cBlack),
        Container(
          width: Get.width,
          height: 55,
          decoration: const BoxDecoration(
            color: Colors.white,
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
                  "Pilih Jenis Pengajuan",
                  style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                ),
              ),
              isDense: true,
              isExpanded: true,
              value: valJenis,
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
                    Radius.circular(8),
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  valJenis = newValue!;
                });
              },
              items: listJenis.map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value['id'],
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      value['name'],
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

  Column dropdownShift1(TukarJadwalController tukarJadwalC) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredText("Jadwal Shift", FontWeight.w600, 11, cBlack),
        tukarJadwalC.isLoading.value
            ? const CircularProgressIndicator()
            : Container(
                width: Get.width,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                        "Pilih Shift",
                        style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                      ),
                    ),
                    isDense: true,
                    isExpanded: true,
                    value: valJadwalShift1,
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
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        valJadwalShift1 = newValue!;
                      });
                    },
                    items: tukarJadwalC.jadwalOnTukarJadwalM?.data
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "TGL: ${value.tanggal.simpleDateRevers()} | SHIFT: ${value.shift} (${value.jamMasuk} - ${value.jamPulang})",
                            style:
                                customTextStyle(FontWeight.w500, 13, cGrey_900),
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

  Column dropdownShift2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredText("Jadwal Shift", FontWeight.w600, 11, cBlack),
        tukarJadwalC.isLoading2.value
            ? const CircularProgressIndicator()
            : Container(
                width: Get.width,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                        "Pilih Shift",
                        style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                      ),
                    ),
                    isDense: true,
                    isExpanded: true,
                    value: valJadwalShift2,
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
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        valJadwalShift2 = newValue!;
                      });
                    },
                    items: tukarJadwalC.jadwalOnTukarJadwalM2?.data
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "TGL: ${value.tanggal.simpleDateRevers()} | SHIFT: ${value.shift} (${value.jamMasuk} - ${value.jamPulang})",
                            style:
                                customTextStyle(FontWeight.w500, 13, cGrey_900),
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

  Column dropdownKaryawan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredText("Nama", FontWeight.w600, 11, cBlack),
        tukarJadwalC.isLoadingKarayawan.value
            ? const CircularProgressIndicator()
            : Container(
                width: Get.width,
                height: 55,
                decoration: const BoxDecoration(
                  color: Colors.white,
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
                        "Pilih Karyawan",
                        style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                      ),
                    ),
                    isDense: true,
                    isExpanded: true,
                    value: valKaryawan,
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
                          Radius.circular(8),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        valKaryawan = null;
                        valKaryawan = newValue!;
                        tukarJadwalC.getJadwalOnTukarJadwalPihak2(valKaryawan);
                      });
                    },
                    items: tukarJadwalC.karyawanPerUnitM?.data
                        .map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        value: value.nip,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            value.nama,
                            style:
                                customTextStyle(FontWeight.w500, 13, cGrey_900),
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

  Widget formUser1(BuildContext context, nip, name) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "NIP",
                style: customTextStyle(FontWeight.w600, 11, cBlack),
              ),
              spaceHeight(5),
              Container(
                height: 38,
                width: Get.width,
                decoration: BoxDecoration(
                  color: cGrey_200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: cGrey_400, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        nip,
                        style: customTextStyle(FontWeight.w500, 13, cGrey_900),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        spaceWidth(5),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Nama",
                style: customTextStyle(FontWeight.w600, 11, cBlack),
              ),
              spaceHeight(5),
              Container(
                height: 38,
                width: Get.width,
                decoration: BoxDecoration(
                  color: cGrey_200,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  border: Border.all(color: cGrey_400, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        shortenLastName(name),
                        style: customTextStyle(FontWeight.w500, 12, cGrey_900),
                      ),
                    ],
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
