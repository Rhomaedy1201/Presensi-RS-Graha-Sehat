import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/progress_ts_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class ProgressComponentsTukarShift extends StatefulWidget {
  const ProgressComponentsTukarShift({super.key});

  @override
  State<ProgressComponentsTukarShift> createState() =>
      _ProgressComponentsTukarShiftState();
}

class _ProgressComponentsTukarShiftState
    extends State<ProgressComponentsTukarShift> {
  ProgressTukarShiftController progressTukarShiftC =
      Get.find<ProgressTukarShiftController>();

  DateTime tglAwal = DateTime.now();
  DateTime tglAkhir = DateTime.now();
  String? status;
  String? tipePengajuan;
  bool filterShow = true;

  @override
  void initState() {
    super.initState();
    progressTukarShiftC.getProgress();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: RefreshIndicator(
        onRefresh: () async {
          print("Refresh");
        },
        child: Obx(
          () => progressTukarShiftC.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(top: 15),
                  itemCount:
                      progressTukarShiftC.progressTukarJadwalM!.data.length,
                  itemBuilder: (context, index) {
                    var data = progressTukarShiftC.progressTukarJadwalM?.data;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: dataCards(
                        // Pihak 1
                        data?[index].pihak1.nama,
                        data?[index].pihak1.nip,
                        data?[index].pihak1.namaJabatan,
                        data?[index].tglPihak1.simpleDateRevers(),
                        data?[index].tglPihak2.simpleDateRevers(),
                        data?[index].shiftPihak1,
                        data?[index].shiftPihak2,
                        // Pihak 2
                        data?[index].pihak2.nama,
                        data?[index].pihak2.nip,
                        data?[index].pihak2.namaJabatan,
                        data?[index].tglPihak2.simpleDateRevers(),
                        data?[index].tglPihak1.simpleDateRevers(),
                        data?[index].shiftPihak2,
                        data?[index].shiftPihak1,
                        // ACC
                        data?[index].accPihak2,
                        data?[index].acc.nama,
                        data?[index].accByAt,
                        data?[index].accSdm,
                        data?[index].accStatus,
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }

  Widget dataCards(
    // pihak 1
    nama1,
    nip1,
    jabatan1,
    tglUtama1,
    tglGanti1,
    kdShiftUtama1,
    kdShiftGanti1,
    // Pihak 2
    nama2,
    nip2,
    jabatan2,
    tglUtama2,
    tglGanti2,
    kdShiftUtama2,
    kdShiftGanti2,
    // ACC
    accPihak2,
    namaAtasan,
    accAtasan,
    accSdm,
    accStatus,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.detailPengajuanView);
      },
      child: Column(
        children: [
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const [
                BoxShadow(
                  color: cGrey_400,
                  blurRadius: 3,
                  offset: Offset(1, 1), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  user1(
                    nama1,
                    nip1,
                    jabatan1,
                    tglUtama1,
                    tglGanti1,
                    kdShiftUtama1,
                    kdShiftGanti1,
                  ),
                  spaceHeight(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Icon(
                          Icons.swap_vert_outlined,
                          size: 22,
                          color: cGrey_600,
                        ),
                      ),
                      Text(
                        "Tukar Shift",
                        style: customTextStyle(FontWeight.w500, 12, cBlack),
                      )
                    ],
                  ),
                  spaceHeight(6),
                  user2(
                    nama2,
                    nip2,
                    jabatan2,
                    tglUtama2,
                    tglGanti2,
                    kdShiftUtama2,
                    kdShiftGanti2,
                  ),
                  spaceHeight(15),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      border: Border.all(color: cGrey_500, width: 1.5),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 3, bottom: 3, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Pihak 2 :",
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                  spaceWidth(3),
                                  accPihak2 != null
                                      ? iconCheck()
                                      : iconWaiting()
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Atasan : ",
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                  Text(
                                    namaAtasan,
                                    style: customTextStyle(
                                        FontWeight.w900, 12, cBlack),
                                  ),
                                  spaceWidth(3),
                                  accAtasan != null
                                      ? iconCheck()
                                      : iconWaiting(),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ACC SDM : ",
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                  spaceWidth(3),
                                  accSdm != null ? iconCheck() : iconWaiting(),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "PENGAJUAN BERHASIL :",
                                    style: customTextStyle(
                                        FontWeight.w900, 12, cBlack),
                                  ),
                                  spaceWidth(3),
                                  accStatus != null
                                      ? iconCheck()
                                      : iconWaiting(),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              print("object");
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: cRed_100,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Icon(
                                Icons.delete_forever,
                                size: 25,
                                color: cRed,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  iconCheck() {
    return const Icon(
      Icons.check_circle_outline,
      size: 17,
      color: cPrimary,
    );
  }

  iconWaiting() {
    return const Icon(
      Icons.timer_outlined,
      size: 17,
      color: cGrey_900,
    );
  }

  Widget user1(nama1, nip1, jabatan1, tglUtama1, tglGanti1, kdShiftUtama1,
      kdShiftGanti1) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            spaceWidth(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama1,
                  style: customTextStyle(FontWeight.w600, 12, cBlack),
                ),
                spaceHeight(1),
                Text(
                  "$nip1 | $jabatan1",
                  style: customTextStyle(FontWeight.w600, 10, cPrimary),
                ),
                spaceHeight(10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 15,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              tglUtama1,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                            spaceWidth(5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 10,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              tglGanti1,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    spaceWidth(3),
                    Container(
                      decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              size: 15,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              "KD : $kdShiftUtama1",
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                            spaceWidth(5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 10,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              kdShiftGanti1,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget user2(
    nama2,
    nip2,
    jabatan2,
    tglUtama2,
    tglGanti2,
    kdShiftUtama2,
    kdShiftGanti2,
  ) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/profile.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            spaceWidth(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama2,
                  style: customTextStyle(FontWeight.w600, 12, cBlack),
                ),
                spaceHeight(1),
                Text(
                  "$nip2 | $jabatan2",
                  style: customTextStyle(FontWeight.w600, 10, cPrimary),
                ),
                spaceHeight(10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              size: 15,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              tglUtama2,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                            spaceWidth(5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 10,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              tglGanti2,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    spaceWidth(3),
                    Container(
                      decoration: BoxDecoration(
                        color: cPrimary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 3,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              size: 15,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              "KD : $kdShiftUtama2",
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                            spaceWidth(5),
                            const Icon(
                              Icons.arrow_forward_rounded,
                              size: 10,
                              color: cBlack,
                            ),
                            spaceWidth(5),
                            Text(
                              kdShiftGanti2,
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget formTglAwal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal Awal",
          style: customTextStyle(FontWeight.w500, 11, cBlack),
        ),
        spaceHeight(5),
        InkWell(
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
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          tglAwal = val;
                          setState(() {});
                        },
                      ),
                    ),
                    // Close the modal
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        print(
                          tglAwal.dateTime().toString(),
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
            height: 35,
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
                    tglAwal.fullDateAll().toString(),
                    style: customTextStyle(FontWeight.w500, 12, cGrey_900),
                  ),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 22,
                    color: cPrimary,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget formTglAkhir(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal Akhir",
          style: customTextStyle(FontWeight.w500, 11, cBlack),
        ),
        spaceHeight(5),
        InkWell(
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
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (val) {
                          tglAkhir = val;
                          setState(() {});
                        },
                      ),
                    ),
                    // Close the modal
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        print(
                          tglAkhir.dateTime().toString(),
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
            height: 35,
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
                    tglAkhir.fullDateAll().toString(),
                    style: customTextStyle(FontWeight.w500, 12, cGrey_900),
                  ),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 22,
                    color: cPrimary,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
