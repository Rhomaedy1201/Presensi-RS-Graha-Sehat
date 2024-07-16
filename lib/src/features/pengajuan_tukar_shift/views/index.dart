import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/tukar_shift_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_datepicker.dart';
import 'package:presensi_gs/utils/components/my_required_text.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class TukarShiftView extends StatefulWidget {
  const TukarShiftView({super.key});

  @override
  State<TukarShiftView> createState() => _TukarShiftViewState();
}

class _TukarShiftViewState extends State<TukarShiftView> {
  PrefsController prefsC = Get.find<PrefsController>();
  TukarJadwalController tukarJadwalC = Get.find<TukarJadwalController>();

  DateTime tglPihak1 = DateTime.now();
  DateTime tglPihak2 = DateTime.now();
  String? valJenis = '1';
  String? valJadwalShift1;
  String? valJadwalShift2;
  String? valKaryawan;

  final List listJenis = [
    {'id': '1', 'name': 'TUKAR SHIFT'},
    {'id': '2', 'name': 'TUKAR OFF 1 (TAMBAH)'},
    {'id': '3', 'name': 'TUKAR OFF 2 (HAPUS)'}
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>[
      'Pengajuan',
      'Progress',
      'Konfirm',
      'Selesai'
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: cGrey_200,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  backgroundColor: cPrimary,
                  foregroundColor: cBlack,
                  centerTitle: true,
                  title: const Text(
                    'Tukar Shift',
                  ),
                  titleTextStyle: customTextStyle(FontWeight.w500, 20, cBlack),
                  pinned: true,
                  expandedHeight: 120,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: TabBar(
                              dividerColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              labelColor: Colors.white,
                              labelStyle: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: const BoxDecoration(
                                color: cPrimary,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              tabs: tabs
                                  .map((String name) => Tab(text: name))
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Obx(
            () => TabBarView(
              children: [
                Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(top: 130),
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
                                        if (valJenis == "3")
                                          Column(
                                            children: [
                                              ketTukarOff2(),
                                              spaceHeight(10),
                                              dropdownKaryawan(),
                                            ],
                                          ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            spaceHeight(12),
                            Text(
                              "Keterangan : ",
                              style:
                                  customTextStyle(FontWeight.w500, 13, cBlack),
                            ),
                            spaceHeight(8),
                            Text(
                              "Jika tukar shift dilakukan untuk pihak 1 atau pertama, maka selanjutnya hanya memilih nama karyawan yang akan menggantikan (pihak 2/kedua) tanpa memilih tanggal dan jadwal shift",
                              style:
                                  customTextStyle(FontWeight.w500, 11, cBlack),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  bottomNavigationBar: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                commingSoon(),
                commingSoon(),
                commingSoon(),
              ],
            ),
          ),
        ),
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

  Widget ketTukarOff2() {
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
                    text: " dan jadwal ",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                  TextSpan(
                    text: "PIHAK 2 ",
                    style: customTextStyle(FontWeight.w600, 10, Colors.red),
                  ),
                  TextSpan(
                    text: " otomatis tergantikan ",
                    style: customTextStyle(FontWeight.w600, 10, cBlack),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

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
                    items: tukarJadwalC.jadwalOnTukarJadwalM!.data
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
              items: <String>['Pagi', 'Malam']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      value,
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

  Column dropdownKaryawan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        requiredText("Nama", FontWeight.w600, 11, cBlack),
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
                  valKaryawan = newValue!;
                });
              },
              items: <String>['Agus', 'Lukman']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      value,
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
                        name,
                        style: customTextStyle(FontWeight.w500, 13, cGrey_900),
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
