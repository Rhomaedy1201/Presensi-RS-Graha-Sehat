import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class DetailSppd extends StatelessWidget {
  const DetailSppd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Detail Sppd"),
      backgroundColor: cGrey_200,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(10),
            Text(
              "NIP :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "23889389",
              style: customTextStyle(FontWeight.w600, 14, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Nama :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "LAILATIN SYARI,S.Kep., Ns",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Dinas :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "PERTEMUAN KLINIK DAN TPMD MONITORING DAN EVALUASI PPS",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Tempat Tujuan :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "DINKES KAB PROBOLINGGO",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Tanggal Berangkat :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "12-09-2024",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Tanggal Kembali :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "22-09-2024",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
            spaceHeight(5),
            Text(
              "Keterangan :",
              style: customTextStyle(FontWeight.w400, 12, cBlack),
            ),
            spaceHeight(3),
            Text(
              "-",
              style: customTextStyle(FontWeight.w600, 13, cBlack),
            ),
            const Divider(
              color: cGrey_400,
            ),
          ],
        ),
      ),
    );
  }
}
