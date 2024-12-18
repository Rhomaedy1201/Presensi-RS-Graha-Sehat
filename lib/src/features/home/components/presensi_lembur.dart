import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/presensi_lembur_controller.dart';

import 'imported_package.dart';

Padding overTimeCard(HomeController homeC, PresensiLemburController presensiLemburC) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: Container(
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: cWhite,
        boxShadow: const [
          BoxShadow(
            color: cGrey_500,
            blurRadius: 10,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
                text: "Presensi Lembur",
                color: cBlack,
                fontSize: 14,
                fontWeight: FontWeight.w600),
            spaceHeight(12),
            Container(
              decoration: BoxDecoration(
                color: cGrey_200,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          homeC.dataPresensiHarian['lembur']['masuk'] == null ? Icons.timelapse : Icons.check_circle,
                          color: homeC.dataPresensiHarian['lembur']['masuk'] == null ? cGrey_500 : cPrimary,
                          size: 18,
                        ),
                        spaceHeight(2),
                        CustomText(
                            text: "${DateTime.parse(homeC.dataPresensiHarian['lembur']['tanggal']).getSimpleDayAndDate()} ${homeC.dataPresensiHarian['lembur']['mulai']}",
                            color: cGrey_900,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                        CustomText(
                            text: "Masuk",
                            color: cGrey_700,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                    Container(width: 1.5, height: 35, color: cGrey_500),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          homeC.dataPresensiHarian['lembur']['keluar'] == null ? Icons.timelapse : Icons.check_circle,
                          color: homeC.dataPresensiHarian['lembur']['keluar'] == null ? cGrey_500 : cPrimary,
                          size: 18,
                        ),
                        spaceHeight(2),
                        CustomText(
                            text: "${DateTime.parse(homeC.dataPresensiHarian['lembur']['tanggal']).getSimpleDayAndDate()} ${homeC.dataPresensiHarian['lembur']['akhir']}",
                            color: cGrey_900,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                        CustomText(
                            text: "Pulang",
                            color: cGrey_700,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            spaceHeight(12),
            Center(
              child: SizedBox(
                width: Get.width / 1.4,
                height: 30,
                child: ElevatedButton(
                  onPressed: homeC.dataPresensiHarian['lembur']['masuk'] == null || homeC.dataPresensiHarian['lembur']['keluar'] == null ? () async {
                    if (homeC.dataPresensiHarian['lembur']['absen']  == "FOTO") {
                      Get.toNamed(
                          RouteNames.cameraLembur,
                          arguments: {
                            "id": homeC.dataPresensiHarian['lembur']['id'] ,
                            "absen": homeC.dataPresensiHarian['lembur']['absen'] == null ? "Masuk" : "Pulang",
                          });
                    } else {
                      Get.toNamed(RouteNames.presensiLocationLembur, 
                      arguments: {
                        "lembur": homeC.dataPresensiHarian['lembur']  
                      });
                    }
                  } : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    backgroundColor: cPrimary_dark,
                    shadowColor: cPrimary,
                    elevation: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                          text: "Presensi ${homeC.dataPresensiHarian['lembur']['masuk'] == null ? "Masuk" : "Pulang"}",
                          color: cWhite,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                      spaceWidth(4),
                      Icon(homeC.dataPresensiHarian['lembur']['absen'] == "GPS" ?  Icons.location_on_outlined : Icons.camera_alt_outlined, size: 15, color: cWhite)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
