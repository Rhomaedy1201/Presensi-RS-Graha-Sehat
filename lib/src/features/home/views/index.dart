import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/home_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_menu_home.dart';
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
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spaceHeight(heightStatusBar + 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          prefsC.isLoading.value ? "..." : prefsC.nama.value,
                          style: customTextStyle(FontWeight.w700, 17, cBlack),
                        ),
                        Text(
                          prefsC.isLoading.value ? "..." : prefsC.jabatan.value,
                          style: customTextStyle(FontWeight.w500, 14, cBlack),
                        ),
                      ],
                    ),
                    Container(
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
                statistikBulanIni(),
                spaceHeight(15),
                Text(
                  "Top Absensi",
                  style: customTextStyle(FontWeight.w600, 15, cBlack),
                ),
                spaceHeight(15),
                dataCards(),
                spaceHeight(5),
                dataCards(),
                spaceHeight(5),
                dataCards(),
                spaceHeight(5),
                dataCards(),
                spaceHeight(5),
                dataCards(),
                spaceHeight(15),
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
                ? debugPrint("NULL ROUTE")
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

  Container statistikBulanIni() {
    return Container(
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
            Container(
              width: Get.width / 4.8,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: cGrey_500, width: 1.5),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "20",
                    style: customTextStyle(FontWeight.w700, 16, cBlack),
                  ),
                  Text(
                    "Hadir",
                    style: customTextStyle(FontWeight.w400, 11, cGrey_900),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width / 4.8,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: cGrey_500, width: 1.5),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "2",
                    style: customTextStyle(FontWeight.w700, 16, cBlack),
                  ),
                  Text(
                    "Telat",
                    style: customTextStyle(FontWeight.w400, 11, cGrey_900),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width / 4.8,
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: cGrey_500, width: 1.5),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "3",
                    style: customTextStyle(FontWeight.w700, 16, cBlack),
                  ),
                  Text(
                    "Alpha",
                    style: customTextStyle(FontWeight.w400, 11, cGrey_900),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width / 4.8,
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Text(
                    "0",
                    style: customTextStyle(FontWeight.w700, 16, cBlack),
                  ),
                  Text(
                    "Izin",
                    style: customTextStyle(FontWeight.w400, 11, cGrey_900),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
