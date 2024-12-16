import 'package:presensi_gs/src/features/attendence/controllers/presensi_controller.dart';

import 'imported_package.dart';

ClipPath componentUser(
    name, jabatan, image, heighStatusBar, HomeController homeC, PresensiController presensiC) {
  return ClipPath(
    child: Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height * 0.555,
          decoration: const BoxDecoration(
            color: cPrimary_dark,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: Get.width,
            height: Get.height * 0.535,
            decoration: const BoxDecoration(
              color: cPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30, right: 30, top: heighStatusBar + 25),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "${homeC.getGreeting()},",
                                color: cGrey_300,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            spaceHeight(3),
                            homeC.isLoadingUser.value
                                ? myShimmer(Get.width * 0.6, 20)
                                : SizedBox(
                                    width: Get.width * 0.6,
                                    child: Text(
                                      name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customTextStyle(
                                          FontWeight.w700, 20, cWhite),
                                    ),
                                  ),
                            homeC.isLoadingUser.value
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: myShimmer(Get.width * 0.3, 13),
                                  )
                                : Text(
                                    jabatan,
                                    style: customTextStyle(
                                        FontWeight.w500, 13, cGrey_300),
                                  ),
                          ],
                        ),
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: cGrey_200,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: cWhite, width: 1),
                            image: image == "null"
                                ? const DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.jpg"),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceHeight(15),
                  workTimeCard(presensiC, homeC),
                  spaceHeight(12),
                  presenceCard(homeC, presensiC),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container workTimeCard(PresensiController presensiC, HomeController homeC) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: cGrey_600,
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
              text: homeC.dataJadwalHarian.length > 0 ? "Jam Kerja Hari ini" : "Hari ini Libur",
              color: homeC.dataJadwalHarian.length > 0 ? cGrey_600 : cRed,
              fontSize: 12,
              fontWeight: FontWeight.w500),
          spaceHeight(8),
          Container(
            decoration: BoxDecoration(
              color: cGrey_200,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.login_sharp,
                        size: 25,
                        color: cPrimary_dark,
                      ),
                      spaceWidth(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Masuk",
                              color: cGrey_700,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                          CustomText(
                              text: homeC.dataJadwalHarian.length > 0 ?   homeC.dataJadwalHarian[0]['jam_masuk'] : "--:--",
                              color: cBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ],
                  ),
                  Container(width: 1.5, height: 35, color: cGrey_500),
                  Row(
                    children: [
                      const Icon(
                        Icons.logout_outlined,
                        size: 25,
                        color: cRed_700,
                      ),
                      spaceWidth(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              text: "Pulang",
                              color: cGrey_700,
                              fontSize: 10,
                              fontWeight: FontWeight.w400),
                          CustomText(
                              text: homeC.dataJadwalHarian.length > 0 ?  homeC.dataJadwalHarian[0]['jam_pulang'] : "--:--",
                              color: cBlack,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          spaceHeight(3)
        ],
      ),
    ),
  );
}

Container presenceCard(HomeController homeC, PresensiController presensiC) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: cPrimary_dark,
          blurRadius: 3,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: "Hari ini, ${DateTime.now().fullDateAll()}",
                  color: cGrey_600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              homeC.isLoadingTime.value
                  ? myShimmer(Get.width * 0.3, 13)
                  : Container(),
              homeC.ntpTime != null
                  ? CustomText(
                      text: homeC.ntpTime!.value.getTimeSecond(),
                      color: cGrey_600,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)
                  : CustomText(
                      text: DateTime.now().getTime(),
                      color: cGrey_600,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
            ],
          ),
          spaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: const Color(0x4506AB95),
                      color: presensiC.isPresensiMasuk.value ? const Color(0x4506AB95) : cGrey_300,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.check_circle,
                        size: 28,
                        color: presensiC.isPresensiMasuk.value ? cPrimary_dark : cGrey_500,
                      ),
                    ),
                  ),
                  spaceWidth(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                              text: "Masuk",
                              color: presensiC.isPresensiMasuk.value ? cGrey_900 : cGrey_500,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                              presensiC.isPresensiMasuk.value ? 
                                Container(
                                  margin: const EdgeInsets.only(left: 3),
                                  decoration: BoxDecoration(
                                    color: cRed_100,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                                    child: CustomText(
                                      text: presensiC.dataCheckAbsenMasukNow['presensi']['status'],
                                      color: cRed,
                                      fontSize: 8,
                                      fontWeight: FontWeight.w500),
                                  ),
                                ) : Container(),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: presensiC.isPresensiMasuk.value ? 0 : 3),
                        child: CustomText(
                            text: presensiC.isPresensiMasuk.value ? presensiC.dataCheckAbsenMasukNow['presensi']['masuk'] :"--:--", 
                            color: cBlack,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                            
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 25,
                child: Image.asset("assets/icons/arrow_right.png"),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cGrey_300,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.check_circle,
                        size: 28,
                        color: cGrey_500,
                      ),
                    ),
                  ),
                  spaceWidth(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Pulang",
                          color: cGrey_500,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CustomText(
                            text: "--:--",
                            color: cGrey_500,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          spaceHeight(17),
          SizedBox(
            width: Get.width / 1.4,
            height: 35,
            child: ElevatedButton(
              onPressed: homeC.dataJadwalHarian.length > 0 ? () => Get.toNamed(RouteNames.presensi) : null,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: cPrimary_dark,
                shadowColor: cPrimary,
                elevation: 5,
              ),
              child: CustomText(
                  text: "Presensi ${ presensiC.dataCheckAbsenMasukNow['presensi'] == null ? "Masuk" : "Pulang"}",
                  color: cWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
          spaceHeight(3)
        ],
      ),
    ),
  );
}
