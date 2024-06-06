import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/histori_presensi/controllers/histori_presensi_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_datepicker.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class HistoriPresensiView extends StatefulWidget {
  const HistoriPresensiView({super.key});

  @override
  State<HistoriPresensiView> createState() => _HistoriPresensiViewState();
}

class _HistoriPresensiViewState extends State<HistoriPresensiView> {
  HistoriPresensiController historiPresensiC =
      Get.find<HistoriPresensiController>();
  DateTime valueDate = DateTime.now();
  int no = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_100,
      appBar: AppBar(
        backgroundColor: cPrimary,
        centerTitle: true,
        title: Text(
          'Histori Presensi',
          style: customTextStyle(FontWeight.w500, 20, cBlack),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              formFilterTanggal(context),
              spaceHeight(20),
              Text(
                "Data Histori",
                style: customTextStyle(FontWeight.w600, 14, cBlack),
              ),
              historiPresensiC.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : historiPresensiC.isEmptyData.value
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
                                  "Histori Presensi Masih Kosong pada \n${valueDate.getMonthAndYear()}",
                                  style: customTextStyle(
                                      FontWeight.w500, 14, cBlack),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              historiPresensiC.historiPresensiM!.data.length,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = historiPresensiC.historiPresensiM!.data;
                            if (data[index].presensi != null) {
                              no++;
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: cardHistoris(
                                  no,
                                  data[index].tanggal.fullDateAll(),
                                  data[index].presensi!.masuk,
                                  data[index].presensi!.pulang,
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }

  Container cardHistoris(no, tgl, jamMasuk, jamKeluar) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: cPurple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    no.toString(),
                    style: customTextStyle(FontWeight.w500, 11, cWhite),
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: cPrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 2,
                  ),
                  child: Text(
                    "$tgl",
                    style: customTextStyle(FontWeight.w500, 11, cBlack),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Aktual Masuk',
                      style: customTextStyle(FontWeight.w400, 12, cBlack),
                    ),
                    spaceHeight(2),
                    Text(
                      '$jamMasuk WIB',
                      style: customTextStyle(FontWeight.w600, 15, cBlack),
                    ),
                  ],
                ),
                Row(
                  children: [
                    dotItem(),
                    spaceWidth(7),
                    dotItem(),
                    spaceWidth(7),
                    dotItem(),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Aktual Keluar',
                      style: customTextStyle(FontWeight.w400, 12, cBlack),
                    ),
                    spaceHeight(2),
                    Text(
                      '$jamKeluar WIB',
                      style: customTextStyle(FontWeight.w600, 15, cBlack),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container dotItem() {
    return Container(
      width: 7,
      height: 7,
      decoration: BoxDecoration(
        color: cPrimary,
        borderRadius: BorderRadius.circular(7),
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
                          historiPresensiC.isEmptyData.value = true;
                          historiPresensiC.historiPresensiM!.data.clear();
                          historiPresensiC.getHistoriPresensi(
                            valueDate.getMonthNumber(),
                            valueDate.getYear(),
                          );
                        })
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
