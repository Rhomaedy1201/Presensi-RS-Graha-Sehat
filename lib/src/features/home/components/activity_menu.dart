import "imported_package.dart";

Widget activityMenu(HomeController homeC) {
  return Container(
    margin: EdgeInsets.only(top: Get.height * 0.385),
    // color: Colors.amber,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: cWhite,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: cGrey_500,
                  blurRadius: 2,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  spaceHeight(5),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Get.toNamed(RouteNames.perizinanView),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Center(
                                  child: Icon(
                                    CommunityMaterialIcons.airplane_takeoff,
                                    size: 30,
                                    color: Color(0xFF00AC06),
                                  ),
                                ),
                                spaceHeight(7),
                                Text(
                                  "Perizinan",
                                  style: customTextStyle(
                                    FontWeight.w400,
                                    12,
                                    cGrey_600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Get.toNamed(RouteNames.tukarShift),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Center(
                                  child: Icon(
                                    Icons.schedule_send,
                                    size: 30,
                                    color: Color(0xFF0217FF),
                                  ),
                                ),
                                spaceHeight(7),
                                Text(
                                  "Tukar Shift",
                                  style: customTextStyle(
                                    FontWeight.w400,
                                    12,
                                    cGrey_600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Get.toNamed(RouteNames.pengajuanLembur),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Center(
                                  child: Icon(
                                    CommunityMaterialIcons.timeline_plus,
                                    size: 30,
                                    color: Colors.amber,
                                  ),
                                ),
                                spaceHeight(7),
                                Text(
                                  "Lembur",
                                  style: customTextStyle(
                                    FontWeight.w400,
                                    12,
                                    cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () => Get.toNamed(RouteNames.sppd),
                          child: SizedBox(
                            child: Column(
                              children: [
                                const Center(
                                  child: Icon(
                                    CommunityMaterialIcons.file_document_edit,
                                    size: 30,
                                    color: Color(0xFFFF5E00),
                                  ),
                                ),
                                spaceHeight(7),
                                Text(
                                  "Sppd",
                                  style: customTextStyle(
                                    FontWeight.w500,
                                    12,
                                    cBlack,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  spaceHeight(5),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: RefreshIndicator(
              onRefresh: () async {
                homeC.checkJadwal();
                homeC.getStatistik();
                homeC.getStr();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeC.isEmptyStr.value ? Container() : spaceHeight(15),
                    homeC.isLoadingStr.value
                        ? Container()
                        : homeC.isEmptyStr.value
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: const Color(0x2CFC1100)),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: Text(
                                          "STR anda akan segera berakhir pada ${homeC.tglStr}. Segera perbarui ke SDM.",
                                          style: customTextStyle(
                                              FontWeight.w500, 11, cRed),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                    const ComponentHome(),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 10, horizontal: 30),
                    //   child: componentCardPresensi(homeC),
                    // ),
                    Container(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container componentCardPresensi(HomeController homeC) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: cGrey_400,
          blurRadius: 3,
          offset: Offset(0, -1), // Shadow position
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          homeC.isLoadingCheckJadwal.value
              ? myShimmer(Get.width * 0.4, 25)
              : Text(
                  homeC.isJadwal.value ? "LIBUR" : homeC.shift.value,
                  style: customTextStyle(FontWeight.w700, 22, cBlack),
                ),
          spaceHeight(5),
          homeC.isLoadingCheckJadwal.value
              ? myShimmer(Get.width * 0.6, 15)
              : homeC.isJadwal.value
                  ? Text(
                      "Tidak ada jadwal",
                      style: customTextStyle(
                        FontWeight.w600,
                        13,
                        const Color(0xFF9F9F9F),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${homeC.jamMasuk.value} WIB",
                          style: customTextStyle(
                            FontWeight.w600,
                            13,
                            const Color(0xFF9F9F9F),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 7),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 14,
                            color: Color(0xFF9F9F9F),
                          ),
                        ),
                        Text(
                          "${homeC.jamPulang.value} WIB",
                          style: customTextStyle(
                            FontWeight.w600,
                            13,
                            const Color(0xFF9F9F9F),
                          ),
                        ),
                      ],
                    ),
          spaceHeight(30),
          InkWell(
            onTap: () {
              Get.toNamed(RouteNames.presensi);
            },
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: cPrimary,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xD633CAD5),
                    blurRadius: 35,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    CommunityMaterialIcons.fingerprint,
                    size: 75,
                    color: cWhite,
                  ),
                  spaceHeight(8),
                  Text(
                    "PRESENSI",
                    style: customTextStyle(
                      FontWeight.w600,
                      13,
                      cWhite,
                    ),
                  ),
                  spaceHeight(10),
                ],
              ),
            ),
          ),
          spaceHeight(35),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: cGrey_400),
                        // color:
                        //     Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          homeC.isLoadingStatistik.value
                              ? "0"
                              : "${homeC.statistikModel?.data.list.tepat.val ?? 0}",
                          style: customTextStyle(
                            FontWeight.w900,
                            18,
                            cPrimary,
                          ),
                        ),
                      ),
                    ),
                    spaceHeight(5),
                    Text(
                      "KEHADIRAN",
                      style: customTextStyle(
                        FontWeight.w600,
                        12,
                        cGrey_900,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: cGrey_400),
                        // color:
                        //     Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          homeC.isLoadingStatistik.value
                              ? "0"
                              : "${homeC.statistikModel?.data.list.telat.val ?? 0}",
                          style: customTextStyle(
                            FontWeight.w900,
                            18,
                            cPrimary,
                          ),
                        ),
                      ),
                    ),
                    spaceHeight(5),
                    Text(
                      "TERLAMBAT",
                      style: customTextStyle(
                        FontWeight.w600,
                        12,
                        cGrey_900,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: cGrey_400),
                        // color:
                        //     Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          homeC.isLoadingStatistik.value
                              ? "0"
                              : "${homeC.statistikModel?.data.list.alpa.val ?? 0}",
                          style: customTextStyle(
                            FontWeight.w900,
                            18,
                            cPrimary,
                          ),
                        ),
                      ),
                    ),
                    spaceHeight(5),
                    Text(
                      "ALPHA",
                      style: customTextStyle(
                        FontWeight.w600,
                        12,
                        cGrey_900,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          spaceHeight(10)
        ],
      ),
    ),
  );
}
