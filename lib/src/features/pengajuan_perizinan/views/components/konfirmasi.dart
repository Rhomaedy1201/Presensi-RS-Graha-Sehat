import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/http/models/progress_izin_model.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/confirm_izin_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/pengajuan_izin_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/components/detail.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';

class KonfirmasiIzin extends StatefulWidget {
  const KonfirmasiIzin({super.key});

  @override
  State<KonfirmasiIzin> createState() => _KonfirmasiIzinState();
}

class _KonfirmasiIzinState extends State<KonfirmasiIzin> {
  ConfirmIzinControlller confirmIzinC = Get.find<ConfirmIzinControlller>();
  PengajuanIzinController pengajuanIzinC = Get.find<PengajuanIzinController>();

  @override
  void initState() {
    confirmIzinC.progressIzinM?.data.clear();
    confirmIzinC.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => confirmIzinC.getData(),
      child: Obx(
        () => confirmIzinC.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : confirmIzinC.isEmptyData.value
                ? Center(
                    child: Text(
                      "Konfirmasi Pengajuan Masih\nKosong!.",
                      textAlign: TextAlign.center,
                      style: customTextStyle(FontWeight.w400, 17, cBlack),
                    ),
                  )
                : ListView.builder(
                    itemCount: confirmIzinC.progressIzinM!.data.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, index) {
                      var data = confirmIzinC.progressIzinM?.data;
                      if (pengajuanIzinC.nipUser.value == data?[index].acc1 &&
                          data?[index].acc1At == null) {
                        return dataCards(data, index);
                      } else if (pengajuanIzinC.nipUser.value ==
                              data?[index].acc2 &&
                          data?[index].acc2At == null) {
                        return dataCards(data, index);
                      } else if (pengajuanIzinC.nipUser.value ==
                              data?[index].acc3 &&
                          data?[index].acc3At == null) {
                        return dataCards(data, index);
                      } else if (pengajuanIzinC.nipUser.value ==
                              data?[index].accSdm &&
                          data?[index].accAt == null) {
                        return dataCards(data, index);
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

  GestureDetector dataCards(List<Datum>? data, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          Get.to(DetailIzin(
            type: "konfirmasi",
            data: {
              'idIzin': data?[index].id,
              'acc1Name': data?[index].acc1By?.nama,
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
              'periodeIzin1': data?[index].izinCuti?.mulai.simpleDateRevers(),
              'periodeIzin2': data?[index].izinCuti?.akhir.simpleDateRevers(),
              'keterangan': data?[index].ket,
              'bukti': data?[index].izinBukti?.idIzin,
              'nipLogin': pengajuanIzinC.nipUser.value,
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
                          "Tgl Pengajuan : ${data?[index].tanggal.simpleDateRevers()} ${data?[index].accSdm}",
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
}
