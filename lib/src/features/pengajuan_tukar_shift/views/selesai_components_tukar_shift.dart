import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/selesai_ts_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/tukar_shift_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class SelesaiComponentsTukarShift extends StatefulWidget {
  const SelesaiComponentsTukarShift({super.key});

  @override
  State<SelesaiComponentsTukarShift> createState() =>
      SelesaiComponentsTukarShiftState();
}

class SelesaiComponentsTukarShiftState
    extends State<SelesaiComponentsTukarShift> {
  SelesaiTukarShiftController selesaiTukarShiftC =
      Get.find<SelesaiTukarShiftController>();
  TukarJadwalController tukarJadwalC = Get.find<TukarJadwalController>();

  DateTime tglAwal = DateTime.now();
  DateTime tglAkhir = DateTime.now();
  String? status;
  String? tipePengajuan;
  bool filterShow = true;

  @override
  void initState() {
    selesaiTukarShiftC.getSelesai();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Filter",
                          style: customTextStyle(FontWeight.w500, 13, cBlack),
                        ),
                        InkWell(
                          onTap: () {
                            filterShow = !filterShow;
                            setState(() {});
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: cWhite,
                              boxShadow: const [
                                BoxShadow(
                                  color: cGrey_400,
                                  blurRadius: 7,
                                  offset: Offset(1, 1), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Icon(
                              filterShow
                                  ? Icons.arrow_drop_up
                                  : Icons.arrow_drop_down_sharp,
                              size: 25,
                              color: cBlack,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  !filterShow
                      ? Container()
                      : Container(
                          width: Get.width,
                          height: 3,
                          color: cGrey_300,
                        ),
                  !filterShow
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: formTglAwal(context),
                                  ),
                                  spaceWidth(10),
                                  Expanded(
                                    flex: 1,
                                    child: formTglAkhir(context),
                                  ),
                                ],
                              ),
                              spaceHeight(10),
                              SizedBox(
                                width: Get.width,
                                height: 35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: cPrimary,
                                    shadowColor: cPrimary_400,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        7,
                                      ), // Mengatur border radius menjadi 0
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Filter",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: cWhite,
                                    ),
                                  ),
                                ),
                              ),
                              spaceHeight(3)
                            ],
                          ),
                        ),
                ],
              ),
            ),
            spaceHeight(10),
            selesaiTukarShiftC.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : !selesaiTukarShiftC.isEmptyData.value
                    ? Center(
                        child: Text(
                          "Progress Pengajuan Masih\nKosong!.",
                          textAlign: TextAlign.center,
                          style: customTextStyle(FontWeight.w400, 17, cBlack),
                        ),
                      )
                    : ListView.builder(
                        itemCount:
                            selesaiTukarShiftC.selesaiTukarJadwalM!.data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var data =
                              selesaiTukarShiftC.selesaiTukarJadwalM?.data;
                          return dataCards(
                            data?[index].tanggal.simpleDateRevers(),
                            data?[index].accStatus,
                            data?[index].namaPihak1,
                            data?[index].pihak1.nip,
                            data?[index].namaPihak2,
                            data?[index].pihak2.nip,
                            data?[index].acc.nama,
                            data?[index].sdm,
                            data?[index].tolak.ket,
                            data?[index].tglPihak1.simpleDateRevers(),
                            data?[index].tglPihak2.simpleDateRevers(),
                            data?[index].shiftPihak1,
                            data?[index].shiftPihak2,
                          );
                        },
                      ),
          ],
        ),
      ),
    );
  }

  Widget dataCards(
    tgl,
    status,
    pihak1,
    nip1,
    pihak2,
    nip2,
    accAtasan,
    accSdm,
    ket,
    tglP1,
    tglP2,
    sp1,
    sp2,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteNames.detailPengajuanView);
      },
      child: Container(
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tanggal",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        SizedBox(
                          child: Text(
                            tgl,
                            maxLines: 2,
                            style: customTextStyle(FontWeight.w600, 12, cBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceWidth(13),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Status",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        Container(
                          decoration: BoxDecoration(
                            color: status == 1 ? cPrimary : cRed_100,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  status == 1 ? "Diterima" : "Ditolak",
                                  style: customTextStyle(
                                      FontWeight.w600, 10, cRed),
                                ),
                                spaceWidth(3),
                                Icon(
                                  status == 1
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.highlight_remove_rounded,
                                  size: 15,
                                  color: cRed,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              spaceHeight(7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pihak 1",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        SizedBox(
                          child: Text(
                            pihak1,
                            maxLines: 2,
                            style: customTextStyle(FontWeight.w600, 12, cBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceWidth(13),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pihak 2",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        SizedBox(
                          width: Get.width * 0.6,
                          child: Text(
                            pihak2,
                            maxLines: 2,
                            style: customTextStyle(FontWeight.w600, 12, cBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              spaceHeight(7),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Acc Atasan",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        SizedBox(
                          child: Text(
                            accAtasan,
                            maxLines: 2,
                            style: customTextStyle(FontWeight.w600, 12, cBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceWidth(13),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Acc SDM",
                          maxLines: 2,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        SizedBox(
                          width: Get.width * 0.6,
                          child: Text(
                            accSdm ?? "--",
                            maxLines: 2,
                            style: customTextStyle(FontWeight.w600, 12, cBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ket == null
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        spaceHeight(8),
                        Text(
                          "Keterangan",
                          maxLines: 1,
                          style:
                              customTextStyle(FontWeight.w500, 11, cGrey_600),
                        ),
                        spaceHeight(2),
                        Text(
                          ket,
                          maxLines: 2,
                          style: customTextStyle(FontWeight.w600, 12, cBlack),
                        ),
                      ],
                    ),
              spaceHeight(8),
              Container(
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: cPrimary,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
                  child: Text(
                    "Perubahan Tukar shift",
                    maxLines: 2,
                    style: customTextStyle(FontWeight.w600, 12, cWhite),
                  ),
                ),
              ),
              spaceHeight(8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (tukarJadwalC.nipUser.value == nip1)
                          SizedBox(
                            child: Text(
                              "$tglP1 : ($sp1)",
                              maxLines: 2,
                              style:
                                  customTextStyle(FontWeight.w700, 12, cBlack),
                            ),
                          ),
                        if (tukarJadwalC.nipUser.value == nip2)
                          SizedBox(
                            child: Text(
                              "$tglP2 : ($sp2)",
                              maxLines: 2,
                              style:
                                  customTextStyle(FontWeight.w700, 12, cBlack),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: cBlack,
                      )),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (tukarJadwalC.nipUser.value == nip1)
                          SizedBox(
                            child: Text(
                              "$tglP2 : ($sp2)",
                              maxLines: 2,
                              style:
                                  customTextStyle(FontWeight.w700, 12, cBlack),
                            ),
                          ),
                        if (tukarJadwalC.nipUser.value == nip2)
                          SizedBox(
                            child: Text(
                              "$tglP1 : ($sp1)",
                              maxLines: 2,
                              style:
                                  customTextStyle(FontWeight.w700, 12, cBlack),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
