import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class DetailPengajuanView extends StatelessWidget {
  const DetailPengajuanView({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {'title': "Nama", 'value': "Muhammad Rhomaedi"},
      {'title': "Nip", 'value': "7812378"},
      {'title': "Jabatan", 'value': "Kepala SDM"},
      {'title': "Tgl pengajuan", 'value': "12 Mei 2024 sampai 15 Mei 2024"},
      {'title': "Pengajuan", 'value': "Izin Sakit"},
      {'title': "Keterangan", 'value': "Sakit Demam dan Lain sebagainya"},
      {'title': "Nama", 'value': "Fikri Atoillah"},
      {'title': "Nip", 'value': "7812000"},
      {'title': "Jabatan", 'value': "Kepala SDM 2"},
    ];
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Detail Pengajuan"),
      bottomNavigationBar: Container(
        color: cWhite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: Get.width,
                  height: 40,
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
                      "Terima",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: cWhite,
                      ),
                    ),
                  ),
                ),
              ),
              spaceWidth(10),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: Get.width,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cRed,
                      shadowColor: cPrimary_400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          7,
                        ), // Mengatur border radius menjadi 0
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Batal",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: cWhite,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              headerLineProses(),
              spaceHeight(15),
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
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                spaceHeight(10),
                                index == 6
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          spaceHeight(5),
                                          Container(
                                            width: Get.width,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: cGrey_300,
                                              border: Border.all(
                                                  color: cGrey_400, width: 1),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: Text(
                                                "Shift Pengganti",
                                                style: customTextStyle(
                                                    FontWeight.w700,
                                                    15,
                                                    cPrimary),
                                              ),
                                            ),
                                          ),
                                          spaceHeight(10),
                                        ],
                                      )
                                    : Container(),
                                Text(
                                  data[index]['title'],
                                  style: customTextStyle(
                                      FontWeight.w500, 12, cGrey_700),
                                ),
                                spaceHeight(3),
                                Text(
                                  data[index]['value'],
                                  style: customTextStyle(
                                      FontWeight.w500, 14, cBlack),
                                ),
                                spaceHeight(7),
                                if (index != data.length - 1)
                                  Container(
                                    width: Get.width,
                                    height: 1,
                                    color: cGrey_500,
                                  )
                                else
                                  Container()
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column headerLineProses() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pengajuan",
              style: customTextStyle(FontWeight.w600, 12, cGrey_700),
            ),
            Text(
              "On Progress",
              style: customTextStyle(FontWeight.w600, 12, cGrey_700),
            ),
            Text(
              "Selesai",
              style: customTextStyle(FontWeight.w600, 12, cGrey_700),
            ),
          ],
        ),
        spaceHeight(5),
        SizedBox(
          width: Get.width,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: cPrimary_800,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.check,
                          size: 14,
                          color: cWhite,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: Get.width,
                        height: 2,
                        color: cGrey_400,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: cGrey_400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: Get.width,
                        height: 2,
                        color: cGrey_400,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: cGrey_400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
