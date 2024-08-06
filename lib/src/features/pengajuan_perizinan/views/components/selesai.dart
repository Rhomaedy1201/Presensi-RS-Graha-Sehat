import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/pengajuan_izin_controller.dart';
import 'package:presensi_gs/http/models/selesai_izin_model.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/selesai_izin_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/detail.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class SelesaiIzin extends StatefulWidget {
  const SelesaiIzin({super.key});

  @override
  State<SelesaiIzin> createState() => _SelesaiIzinState();
}

class _SelesaiIzinState extends State<SelesaiIzin> {
  SelesaiIzinController selesaiIzinC = Get.find<SelesaiIzinController>();
  PengajuanIzinController pengajuanIzinC = Get.find<PengajuanIzinController>();

  DateTime tglAwal = DateTime.now();
  bool filterShow = true;

  @override
  void initState() {
    selesaiIzinC.selesaiIzinModel?.data.clear();
    selesaiIzinC.getData(tglAwal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.linear,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Container(
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
                                formTglAwal(context),
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
                                    onPressed: () {
                                      selesaiIzinC.getData(tglAwal);
                                    },
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
            ),
          ),
          selesaiIzinC.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : selesaiIzinC.isEmptyData.value
                  ? Center(
                      child: Text(
                        "Pengajuan Selesai Masih\nKosong Pada ${tglAwal.getMonthAndYear()}.",
                        textAlign: TextAlign.center,
                        style: customTextStyle(FontWeight.w400, 17, cBlack),
                      ),
                    )
                  : ListView.builder(
                      itemCount: selesaiIzinC.selesaiIzinModel!.data.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var data = selesaiIzinC.selesaiIzinModel?.data;
                        if (data!.isNotEmpty) {
                          return dataCards(data, index);
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(top: Get.height / 6),
                            child: Text(
                              "Confirmasi Pengajuan Masih\nKosong!.",
                              textAlign: TextAlign.center,
                              style:
                                  customTextStyle(FontWeight.w400, 17, cBlack),
                            ),
                          );
                        }
                      },
                    ),
        ],
      ),
    );
  }

  GestureDetector dataCards(List<Datum>? data, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Get.to(DetailIzin(
            type: "selesai",
            data: {
              'idIzin': data?[index].id,
              'acc1Name': data?[index].acc1By.nama,
              'acc2Name': data?[index].acc2By?.nama,
              'acc3Name': data?[index].acc3By?.nama,
              'accSdmName': "",
              'acc1': data?[index].acc1,
              'acc2': data?[index].acc2,
              'acc3': data?[index].acc3,
              'accSdm': data?[index].accSdm,
              'acc1At': data?[index].acc1At,
              'acc2At': data?[index].acc2At,
              'acc3At': data?[index].acc3At,
              'accSdmAt': data?[index].accAt,
              'accStatus': data?[index].accStatus,
              'kodeIzin': data?[index].kodeIzin,
              'izin': data?[index].izin,
              'tanggal': data?[index].tanggal.simpleDateRevers(),
              'nip': data?[index].nip,
              'nama': data?[index].nama,
              'periodeIzin1': data?[index].izinCuti.mulai.simpleDateRevers(),
              'periodeIzin2': data?[index].izinCuti.akhir.simpleDateRevers(),
              'keterangan': data?[index].ket,
              'bukti': data?[index].izinBukti?.idIzin,
              'nipLogin': pengajuanIzinC.nipUser.value,
              'tolak': data?[index].tolak?.ket,
            },
          ));
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tgl Pengajuan : ${data?[index].tanggal.simpleDateRevers()}",
                          style: customTextStyle(FontWeight.w500, 11, cBlack),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: cPrimary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 1),
                            child: Text(
                              "${data?[index].izin} (${data?[index].kodeIzin})",
                              style: customTextStyle(
                                FontWeight.w600,
                                10,
                                cWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            spaceWidth(10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width * 0.4,
                                  child: Text(
                                    "${data?[index].nama}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                ),
                                spaceHeight(1),
                                Text(
                                  "${data?[index].nip}",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cGrey_700),
                                ),
                              ],
                            )
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: data?[index].accStatus == 2
                                ? cPrimary_800
                                : cRed_100,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data?[index].accStatus == 2
                                      ? "Diterima"
                                      : "Ditolak",
                                  style: customTextStyle(
                                      FontWeight.w600,
                                      10,
                                      data?[index].accStatus == 2
                                          ? cWhite
                                          : cRed),
                                ),
                                spaceWidth(3),
                                Icon(
                                  data?[index].accStatus == 2
                                      ? Icons.check_circle_outline_rounded
                                      : Icons.highlight_remove_rounded,
                                  size: 15,
                                  color: data?[index].accStatus == 2
                                      ? cWhite
                                      : cRed,
                                )
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
          ],
        ),
      ),
    );
  }

  Widget formTglAwal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tanggal",
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
                        initialDateTime: tglAwal,
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumYear: 2024,
                        mode: CupertinoDatePickerMode.monthYear,
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
                    tglAwal.getMonthAndYear().toString(),
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
