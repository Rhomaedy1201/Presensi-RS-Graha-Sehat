import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/confirm_ts_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/tukar_shift_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class ConfirmComponentsTukarShift extends StatefulWidget {
  const ConfirmComponentsTukarShift({super.key});

  @override
  State<ConfirmComponentsTukarShift> createState() =>
      ConfirmComponentsTukarShiftState();
}

class ConfirmComponentsTukarShiftState
    extends State<ConfirmComponentsTukarShift> {
  ConfirmTukarShiftController confirmTukarShiftC =
      Get.find<ConfirmTukarShiftController>();
  TukarJadwalController tukarJadwalC = Get.find<TukarJadwalController>();
  DateTime tglAwal = DateTime.now();
  DateTime tglAkhir = DateTime.now();
  String? status;
  String? tipePengajuan;
  bool filterShow = true;

  @override
  void initState() {
    confirmTukarShiftC.getConfirm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Obx(
        () => confirmTukarShiftC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : !confirmTukarShiftC.isEmptyData.value
                ? Center(
                    child: Text(
                      "Confirmasi Pengajuan Masih\nKosong!.",
                      textAlign: TextAlign.center,
                      style: customTextStyle(FontWeight.w400, 17, cBlack),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        confirmTukarShiftC.confirmTukarJadwalM!.data.length,
                    itemBuilder: (context, index) {
                      var data = confirmTukarShiftC.confirmTukarJadwalM?.data;
                      if (tukarJadwalC.nipUser.value ==
                              data?[index].pihak2.nip &&
                          data?[index].accPihak2 == null) {
                        return dataCards(
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
                          "pihak2",
                          data?[index].id,
                        );
                      } else if (tukarJadwalC.nipUser.value ==
                              data?[index].acc.nip &&
                          data?[index].accByAt == null) {
                        return dataCards(
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
                          "atasan",
                          data?[index].id,
                        );
                      } else if (tukarJadwalC.roleUser.value == "SDM" &&
                          data?[index].accSdm == null &&
                          data?[index].accByAt != null) {
                        return dataCards(
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
                          "sdm",
                          data?[index].id,
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(top: Get.height / 2.7),
                          child: Text(
                            "Confirmasi Pengajuan Masih\nKosong!.",
                            textAlign: TextAlign.center,
                            style: customTextStyle(FontWeight.w400, 17, cBlack),
                          ),
                        );
                      }
                    },
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
    // Confirm
    type,
    idIzin,
  ) {
    return Column(
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
                            confirmTukarShiftC.accConfirm(type, idIzin);
                          },
                          child: const Text(
                            "Terima",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: cWhite,
                            ),
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
                            showInputDialog(context, idIzin);
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
      ],
    );
  }

  void showInputDialog(BuildContext context, id) {
    final TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: cWhite,
          title: Text(
            'Keterangan',
            style: customTextStyle(FontWeight.w500, 18, cBlack),
          ),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Masukkan Alasan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                contentPadding: EdgeInsets.all(12.0),
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
              child: const Text('Save'),
              onPressed: () {
                String input = _controller.text;
                // Lakukan sesuatu dengan inputan
                print('Input: $input');
                confirmTukarShiftC.tolakConfirm(id, input, "TUKARJADWAL");
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
