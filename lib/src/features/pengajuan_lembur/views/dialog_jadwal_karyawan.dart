import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

Future<void> dialogJadwalKaryawan(Map dataJadwal) {
  return Get.dialog(
    Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 300),
        child: Container(
          decoration: BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: Get.width,
                height: 50,
                decoration: const BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Jadwal Karyawan",
                          color: cBlack,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.close, size: 20),
                      )
                    ],
                  ),
                ),
              ),
              spaceHeight(10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Membolehkan scroll horizontal
                  child: SingleChildScrollView(
                    scrollDirection:
                        Axis.vertical, // Membolehkan scroll vertikal
                    child: DataTable(
                      dataTextStyle: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w500),
                      dataRowColor: const MaterialStatePropertyAll(cGrey_300),
                      headingRowColor: MaterialStatePropertyAll(cPrimary),
                      headingTextStyle: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w400),
                      headingRowHeight: 30,
                      dataRowHeight: 35,
                      columns: const [
                        DataColumn(label: Text('No')),
                        DataColumn(label: Text('Unit')),
                        DataColumn(label: Text('Nama')),
                        DataColumn(label: Text('Tanggal')),
                        DataColumn(label: Text('Shift')),
                        DataColumn(label: Text('Absen')),
                        DataColumn(label: Text('Pulang')),
                        DataColumn(label: Text('Ket')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: List<DataRow>.generate(
                        1,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text('${dataJadwal['unit']}')),
                            DataCell(Text('${dataJadwal['nama']}')),
                            DataCell(Text('${dataJadwal['tanggal']}')),
                            DataCell(Text('${dataJadwal['shift']}')),
                            DataCell(Text('${dataJadwal['absen']}')),
                            DataCell(Text('${dataJadwal['pulang']}')),
                            DataCell(Text('${dataJadwal['ket']}')),
                            DataCell(Text('${dataJadwal['status']}')),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
