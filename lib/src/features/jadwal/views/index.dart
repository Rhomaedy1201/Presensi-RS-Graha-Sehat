import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:presensi_gs/src/features/jadwal/controllers/jadwal_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class JadwalView extends StatefulWidget {
  const JadwalView({super.key});

  @override
  State<JadwalView> createState() => _JadwalViewState();
}

class _JadwalViewState extends State<JadwalView> {
  DateTime valueDate = DateTime.now();
  JadwalController jadwalC = Get.put(JadwalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_100,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          'Jadwal',
          style: customTextStyle(FontWeight.w500, 20, cBlack),
        ),
      ),
      body: Obx(() => jadwalC.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  formFilterTanggal(context),
                  spaceHeight(20),
                  Text(
                    "List Jadwal",
                    style: customTextStyle(FontWeight.w600, 14, cBlack),
                  ),
                  spaceHeight(10),
                  jadwalC.isEmptyData.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 120),
                          child: Center(
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.warning_amber,
                                  size: 30,
                                ),
                                spaceHeight(10),
                                Text(
                                  "Jadwal Masih Kosong pada \n${valueDate.getMonthAndYear()}",
                                  style: customTextStyle(
                                      FontWeight.w500, 14, cBlack),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: jadwalC.jadwalData.length,
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data = jadwalC.jadwalData;
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: cardJadwal(
                                  data[index]["tanggal"],
                                  data[index]["jam_masuk"] ?? 'null',
                                  data[index]["jam_pulang"] ?? 'null',
                                  data[index]["kode_shift"] ?? 'null',
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ),
            )),
    );
  }

  Container cardJadwal(
    tgl,
    jamMasuk,
    jamPulang,
    shift,
  ) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        color: cWhite,
        borderRadius: BorderRadius.circular(7),
        boxShadow: const [
          BoxShadow(
            color: cGrey_400,
            blurRadius: 7,
            offset: Offset(1, 1), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  DateFormat('yyyy-MM-dd').parse(tgl).getDay(),
                  style: customTextStyle(FontWeight.w500, 11, cBlack),
                ),
                spaceHeight(3),
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: jamMasuk == 'null' ? cRed : cPrimary,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('yyyy-MM-dd').parse(tgl).getTgl(),
                        style: customTextStyle(FontWeight.w700, 12, cBlack),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd').parse(tgl).getMonth(),
                        style: customTextStyle(FontWeight.w500, 9, cBlack),
                      ),
                    ],
                  ),
                )
              ],
            ),
            spaceWidth(15),
            jamPulang == 'null'
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Libur",
                        style: customTextStyle(FontWeight.w600, 12, cRed),
                      ),
                      spaceHeight(3),
                      Text(
                        "Tidak Ada Jadwal".toUpperCase(),
                        style: customTextStyle(FontWeight.w600, 15, cBlack),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shift,
                        style: customTextStyle(FontWeight.w600, 12, cPrimary),
                      ),
                      spaceHeight(3),
                      Text(
                        "$jamMasuk WIB -- $jamPulang WIB",
                        style: customTextStyle(FontWeight.w600, 15, cBlack),
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }

  Widget formFilterTanggal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Filter",
          style: customTextStyle(FontWeight.w600, 14, cBlack),
        ),
        spaceHeight(5),
        InkWell(
          onTap: () async {
            // if (GetPlatform.isAndroid) {
            //   final date = await datePicker(context, DateTime.now());
            //   if (mounted) {
            //     setState(() {
            //       valueDate = date ?? DateTime.now();
            //     });
            //   }
            // } else if (GetPlatform.isIOS) {
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
                        initialDateTime:
                            valueDate != null ? valueDate : DateTime.now(),
                        maximumDate: DateTime.now(),
                        maximumYear: DateTime.now().year,
                        minimumYear: 2024,
                        mode: CupertinoDatePickerMode.monthYear,
                        onDateTimeChanged: (val) {
                          setState(() {
                            valueDate = val;
                          });
                        },
                      ),
                    ),
                    // Close the modal
                    CupertinoButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                        jadwalC.jadwalData.clear();
                        print(valueDate.getMonthNumber());
                        jadwalC.getJadwal(
                            valueDate.getMonthNumber(), valueDate.getYear());
                      },
                    )
                  ],
                ),
              ),
            );
            // }
          },
          child: Container(
            height: 40,
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
                  Text(valueDate.getMonthAndYear().toString()),
                  const Icon(
                    Icons.date_range_outlined,
                    size: 25,
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
