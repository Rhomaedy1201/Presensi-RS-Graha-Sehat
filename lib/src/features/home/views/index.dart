import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/home_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_dialog.dart';
import 'package:presensi_gs/utils/components/my_menu_home.dart';
import 'package:presensi_gs/utils/components/my_shoten_last_name.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController homeC = Get.find<HomeController>();
  PrefsController prefsC = Get.find<PrefsController>();
  List statistikPresensi = [
    {'nama': 'Hadir', 'value': 10},
    {'nama': 'Telat', 'value': 4},
    {'nama': 'Alpha', 'value': 2},
    {'nama': 'Izin', 'value': 0},
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cGrey_100,
      body: Obx(
        () => RefreshIndicator(
          onRefresh: () async {
            homeC.checkJadwal();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(heightStatusBar + 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            // color: cPrimary,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: cPrimary, width: 2),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/profile.jpg"),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        spaceWidth(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.6,
                              child: Text(
                                prefsC.isLoading.value
                                    ? "..."
                                    : shortenLastName(prefsC.nama.value),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customTextStyle(
                                    FontWeight.w700, 17, cBlack),
                              ),
                            ),
                            Text(
                              prefsC.isLoading.value
                                  ? "..."
                                  : prefsC.jabatan.value,
                              style:
                                  customTextStyle(FontWeight.w500, 14, cBlack),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        homeC.checkJadwal();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: cWhite,
                          boxShadow: [
                            BoxShadow(
                              color: cGrey_400,
                              blurRadius: 15,
                              offset: Offset(1, 1), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Icon(
                          Icons.notifications,
                          size: 22,
                          color: cPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
                spaceHeight(30),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: cPrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jadwal hari ini",
                              style:
                                  customTextStyle(FontWeight.w500, 13, cWhite),
                            ),
                            Text(
                              homeC.isLoadingCheckJadwal.value
                                  ? "..."
                                  : homeC.isJadwal.value
                                      ? "Kosong"
                                      : "${homeC.shift.value} | ${homeC.jamMasuk.value} WIB -- ${homeC.jamPulang.value} WIB",
                              style:
                                  customTextStyle(FontWeight.w700, 17, cWhite),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.calendar_today_outlined,
                          color: cWhite,
                          size: 24,
                        )
                      ],
                    ),
                  ),
                ),
                spaceHeight(25),
                cardMenu(),
                spaceHeight(25),
                Text(
                  "Statistik Bulan ini",
                  style: customTextStyle(FontWeight.w600, 15, cBlack),
                ),
                spaceHeight(15),
                homeC.isLoadingStatistik.value
                    ? const Center(child: CircularProgressIndicator())
                    : statistikBulanIni(
                        homeC.statistikModel?.data.list.tepat.val.toString(),
                        homeC.statistikModel?.data.list.telat.val.toString(),
                        homeC.statistikModel?.data.list.alpa.val.toString(),
                      ),
                // Center(
                //   child: Padding(
                //     padding: const EdgeInsets.only(top: 10),
                //     child: Text(
                //       "Coming Soon",
                //       style: customTextStyle(FontWeight.w500, 14, cGrey_600),
                //     ),
                //   ),
                // ),
                spaceHeight(15),
                Text(
                  "Top Absensi",
                  style: customTextStyle(FontWeight.w600, 15, cBlack),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      "Coming Soon",
                      style: customTextStyle(FontWeight.w500, 14, cGrey_600),
                    ),
                  ),
                ),
                // spaceHeight(15),
                // dataCards(),
                // spaceHeight(5),
                // dataCards(),
                // spaceHeight(5),
                // dataCards(),
                // spaceHeight(5),
                // dataCards(),
                // spaceHeight(5),
                // dataCards(),
                // spaceHeight(15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView cardMenu() {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: MenuHome().menu.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 30,
        childAspectRatio: 8 / 10,
        mainAxisSpacing: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var data = MenuHome().menu;
        return GestureDetector(
          // splashColor: cPrimary,
          onTap: () {
            data[index]['route'] == null
                ? dialogComingSoon(data[index]['title'])
                : Get.toNamed(data[index]['route']);
          },
          child: SizedBox(
            height: 50,
            width: 50,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  height: 60,
                  decoration: BoxDecoration(
                    color: data[index]['bg_color'],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    data[index]['icon'],
                    size: 35,
                    color: data[index]['icon_color'],
                  ),
                ),
                spaceHeight(3),
                Text(
                  data[index]['title'],
                  style: customTextStyle(FontWeight.w500, 10, cBlack),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget dataCards() {
    return GestureDetector(
      onTap: () {},
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
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                        "Muhammad Rhomaedi",
                        style: customTextStyle(FontWeight.w600, 12, cBlack),
                      ),
                      spaceHeight(1),
                      Row(
                        children: [
                          Text(
                            "Kepala SDM",
                            style:
                                customTextStyle(FontWeight.w500, 10, cGrey_900),
                          ),
                          spaceWidth(5),
                          Container(width: 1, height: 10, color: cGrey_900),
                          spaceWidth(5),
                          Text(
                            "012377",
                            style:
                                customTextStyle(FontWeight.w500, 10, cGrey_900),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget statistikBulanIni(hadir, telat, alpha) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: cWhite,
          // border: Border.all(width: 1.5, color: cGrey_500),
          boxShadow: const [
            BoxShadow(
              color: cGrey_400,
              blurRadius: 8,
              offset: Offset(1, 1), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: cGrey_500, width: 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        hadir,
                        style: customTextStyle(FontWeight.w700, 16, cBlack),
                      ),
                      Text(
                        "KEHADIRAN",
                        style: customTextStyle(FontWeight.w500, 11, cGrey_700),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: cGrey_500, width: 1.5),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        telat,
                        style: customTextStyle(FontWeight.w700, 16, cBlack),
                      ),
                      Text(
                        "TERLAMBAT",
                        style: customTextStyle(FontWeight.w500, 11, cGrey_700),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Column(
                    children: [
                      Text(
                        alpha,
                        style: customTextStyle(FontWeight.w700, 16, cBlack),
                      ),
                      Text(
                        "ALPHA",
                        style: customTextStyle(FontWeight.w500, 11, cGrey_700),
                      ),
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
}
