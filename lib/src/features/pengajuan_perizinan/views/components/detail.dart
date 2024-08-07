import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/confirm_izin_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class DetailIzin extends StatefulWidget {
  String type;
  var data = {};

  DetailIzin({super.key, required this.type, required this.data});

  @override
  State<DetailIzin> createState() => _DetailIzinState();
}

class _DetailIzinState extends State<DetailIzin> {
  ConfirmIzinControlller confirmIzinC = Get.find<ConfirmIzinControlller>();
  @override
  void initState() {
    if (widget.data['accSdm'] != null) {
      confirmIzinC.getKaryawanByNip(widget.data['accSdm']);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Detail Izin"),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    spaceHeight(5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tgl Pengajuan : ${widget.data['tanggal']}",
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
                              "${widget.data['izin']} (${widget.data['kodeIzin']})",
                              style:
                                  customTextStyle(FontWeight.w600, 10, cWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                    spaceHeight(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  width: Get.width * 0.7,
                                  child: Text(
                                    widget.data['nama'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: customTextStyle(
                                        FontWeight.w600, 12, cBlack),
                                  ),
                                ),
                                spaceHeight(1),
                                Text(
                                  widget.data['nip'],
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cGrey_700),
                                ),
                              ],
                            )
                          ],
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: widget.data['accStatus'] == 2
                        //         ? cPrimary_800
                        //         : cRed_100,
                        //     borderRadius: BorderRadius.circular(5),
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 4, vertical: 1),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Text(
                        //           widget.data['accStatus'] == 2
                        //               ? "Diterima"
                        //               : "Ditolak",
                        //           style: customTextStyle(
                        //               FontWeight.w600,
                        //               10,
                        //               widget.data['accStatus'] == 2
                        //                   ? cWhite
                        //                   : cRed),
                        //         ),
                        //         spaceWidth(3),
                        //         Icon(
                        //           widget.data['accStatus'] == 2
                        //               ? Icons.check_circle_outline_rounded
                        //               : Icons.highlight_remove_rounded,
                        //           size: 15,
                        //           color: widget.data['accStatus'] == 2
                        //               ? cWhite
                        //               : cRed,
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    spaceHeight(10),
                    Text(
                      "Detail:",
                      style: customTextStyle(FontWeight.w500, 11, cBlack),
                    ),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: cGrey_400, width: 1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.data['accStatus'] == 2 ||
                              widget.data['accStatus'] == 3)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  widget.data['accStatus'] == 3
                                      ? Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Keterangan Tolak:",
                                                style: customTextStyle(
                                                    FontWeight.w500,
                                                    10,
                                                    cBlack),
                                              ),
                                              spaceHeight(2),
                                              SizedBox(
                                                width: Get.width * 0.4,
                                                child: Text(
                                                  "${widget.data['tolak']}",
                                                  style: customTextStyle(
                                                      FontWeight.w800,
                                                      11,
                                                      cBlack),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(),
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Status:",
                                          style: customTextStyle(
                                              FontWeight.w500, 10, cBlack),
                                        ),
                                        spaceHeight(2),
                                        Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: widget.data['accStatus'] == 2
                                                ? cPrimary_800
                                                : cRed_100,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4, vertical: 1),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  widget.data['accStatus'] == 2
                                                      ? "Diterima"
                                                      : "Ditolak",
                                                  style: customTextStyle(
                                                      FontWeight.w600,
                                                      10,
                                                      widget.data['accStatus'] ==
                                                              2
                                                          ? cWhite
                                                          : cRed),
                                                ),
                                                spaceWidth(3),
                                                Icon(
                                                  widget.data['accStatus'] == 2
                                                      ? Icons
                                                          .check_circle_outline_rounded
                                                      : Icons
                                                          .highlight_remove_rounded,
                                                  size: 15,
                                                  color: widget.data[
                                                              'accStatus'] ==
                                                          2
                                                      ? cWhite
                                                      : cRed,
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
                            ),
                          if (widget.data['accStatus'] == 2 ||
                              widget.data['accStatus'] == 3)
                            Container(
                              width: Get.width,
                              height: 1,
                              color: cGrey_400,
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Periode Izin:",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                                spaceHeight(2),
                                Text(
                                  widget.data['periodeIzin2'] == null ||
                                          widget.data['periodeIzin2'] == "null"
                                      ? "${widget.data['periodeIzin1']}"
                                      : "${widget.data['periodeIzin1']} -> ${widget.data['periodeIzin2']}",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: cGrey_400,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pengganti:",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                                spaceHeight(2),
                                Text(
                                  "${widget.data['acc1Name']} (${widget.data['acc1']})",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width,
                            height: 1,
                            color: cGrey_400,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keterangan:",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                                spaceHeight(2),
                                Text(
                                  widget.data['keterangan'] ?? "-",
                                  style: customTextStyle(
                                      FontWeight.w500, 10, cBlack),
                                ),
                              ],
                            ),
                          ),
                          if (widget.data['bukti'] != null)
                            Container(
                              width: Get.width,
                              height: 1,
                              color: cGrey_400,
                            ),
                          if (widget.data['bukti'] != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Bukti:",
                                    style: customTextStyle(
                                        FontWeight.w500, 10, cBlack),
                                  ),
                                  spaceHeight(2),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Dialog(
                                            child: Container(
                                              width: 300,
                                              height: 300,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: NetworkImage(widget
                                                      .data['bukti']
                                                      .toString()),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              widget.data['bukti'].toString()),
                                        ),
                                      ),
                                      child: Container(
                                        width: 60,
                                        height: 10,
                                        color: const Color(0x6F000000),
                                        child: Center(
                                          child: Text(
                                            "Lihat\nGambar",
                                            style: customTextStyle(
                                              FontWeight.w600,
                                              11,
                                              cWhite,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    spaceHeight(10),
                    Text(
                      "Persetujuan:",
                      style: customTextStyle(FontWeight.w500, 11, cBlack),
                    ),
                    spaceHeight(8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    color: widget.data['acc1At'] != null
                                        ? cPrimary_800
                                        : cGrey_500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: widget.data['acc1At'] != null
                                      ? const Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 13,
                                            color: cWhite,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                            if (widget.data['acc2'] != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 1.7,
                                    height: 30,
                                    color: cGrey_500,
                                  ),
                                  Container(
                                    width: 17,
                                    height: 17,
                                    decoration: BoxDecoration(
                                      color: widget.data['acc2At'] != null
                                          ? cPrimary_800
                                          : cGrey_500,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: widget.data['acc2At'] != null
                                        ? const Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 13,
                                              color: cWhite,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            if (widget.data['acc3'] != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 1.7,
                                    height: 30,
                                    color: cGrey_500,
                                  ),
                                  Container(
                                    width: 17,
                                    height: 17,
                                    decoration: BoxDecoration(
                                      color: widget.data['acc3At'] != null
                                          ? cPrimary_800
                                          : cGrey_500,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: widget.data['acc3At'] != null
                                        ? const Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 13,
                                              color: cWhite,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                            if (widget.data['accSdm'] != null)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 1.7,
                                    height: 30,
                                    color: cGrey_500,
                                  ),
                                  Container(
                                    width: 17,
                                    height: 17,
                                    decoration: BoxDecoration(
                                      color: widget.data['accSdmAt'] != null
                                          ? cPrimary_800
                                          : cGrey_500,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: widget.data['accSdmAt'] != null
                                        ? const Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 13,
                                              color: cWhite,
                                            ),
                                          )
                                        : Container(),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        spaceWidth(7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "ACC 1 : ${widget.data['acc1Name']}",
                                  style: customTextStyle(
                                      FontWeight.w500, 11, cBlack),
                                ),
                                spaceHeight(30),
                              ],
                            ),
                            if (widget.data['acc2'] != null)
                              Column(
                                children: [
                                  Text(
                                    "ACC 2 : ${widget.data['acc2Name']}",
                                    style: customTextStyle(
                                        FontWeight.w500, 11, cBlack),
                                  ),
                                  spaceHeight(30),
                                ],
                              ),
                            if (widget.data['acc3'] != null)
                              Column(
                                children: [
                                  Text(
                                    "ACC 3 : ${widget.data['acc3Name']}",
                                    style: customTextStyle(
                                        FontWeight.w500, 11, cBlack),
                                  ),
                                  spaceHeight(30),
                                ],
                              ),
                            if (widget.data['accSdm'] != null)
                              Column(
                                children: [
                                  Text(
                                    confirmIzinC.isLoadingKaryawan.value
                                        ? "ACC SDM : ..."
                                        : "ACC SDM : ${confirmIzinC.mKaryawanM?.data.nama}",
                                    style: customTextStyle(
                                        FontWeight.w500, 11, cBlack),
                                  ),
                                  spaceHeight(30),
                                ],
                              ),
                            confirmIzinC.isLoadingKaryawan.value
                                ? Container()
                                : Container()
                          ],
                        ),
                      ],
                    ),
                    if (widget.type == "konfirmasi")
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: Get.width,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cPrimary,
                                  shadowColor: cPrimary_400,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ), // Mengatur border radius menjadi 0
                                  ),
                                ),
                                onPressed: () {
                                  if (widget.data['nipLogin'] ==
                                      widget.data['acc1']) {
                                    confirmIzinC.accConfirm(
                                        "acc1", widget.data['idIzin']);
                                  } else if (widget.data['nipLogin'] ==
                                      widget.data['acc2']) {
                                    confirmIzinC.accConfirm(
                                        "acc2", widget.data['idIzin']);
                                  } else if (widget.data['nipLogin'] ==
                                      widget.data['acc3']) {
                                    confirmIzinC.accConfirm(
                                        "acc3", widget.data['idIzin']);
                                  } else if (widget.data['nipLogin'] ==
                                      widget.data['accSdm']) {
                                    confirmIzinC.accConfirm(
                                        "acc_sdm", widget.data['idIzin']);
                                  }
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (widget.data['nipLogin'] ==
                                        widget.data['acc1'])
                                      const Text(
                                        "Terima ACC 1",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: cWhite,
                                        ),
                                      ),
                                    if (widget.data['nipLogin'] ==
                                        widget.data['acc2'])
                                      const Text(
                                        "Terima ACC 2",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: cWhite,
                                        ),
                                      ),
                                    if (widget.data['nipLogin'] ==
                                        widget.data['acc3'])
                                      const Text(
                                        "Terima ACC 3",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: cWhite,
                                        ),
                                      ),
                                    if (widget.data['nipLogin'] ==
                                        widget.data['accSdm'])
                                      const Text(
                                        "Terima ACC SDM",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: cWhite,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          spaceWidth(5),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: Get.width,
                              height: 30,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: cRed,
                                  shadowColor: cPrimary_400,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ), // Mengatur border radius menjadi 0
                                  ),
                                ),
                                onPressed: () {
                                  showInputDialog(
                                      context, widget.data['idIzin']);
                                },
                                child: const Text(
                                  "Tolak",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: cWhite,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showInputDialog(BuildContext context, idIzin) {
    final TextEditingController ketTolakC = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cWhite,
          title: Text(
            'Keterangan Tolak',
            style: customTextStyle(FontWeight.w500, 18, cBlack),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: ketTolakC,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Masukkan Alasan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: const EdgeInsets.all(12.0),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Tolak',
                style: customTextStyle(FontWeight.w500, 14, cRed),
              ),
              onPressed: () {
                String input = ketTolakC.text;
                confirmIzinC.tolakConfirm(idIzin, input, "IZIN");
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        );
      },
    );
  }
}
