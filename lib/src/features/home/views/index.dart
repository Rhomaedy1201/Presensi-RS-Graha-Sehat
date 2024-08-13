import 'package:community_material_icon/community_material_icon.dart';
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
      backgroundColor: cGrey_200,
      appBar: AppBar(
        backgroundColor: cPrimary,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            width: 135,
            child: Image.asset("assets/icons/logo3.png"),
          ),
        ),
        actions: [
          const Icon(
            Icons.notifications,
            size: 25,
            color: cWhite,
          ),
          spaceWidth(20),
        ],
      ),
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              width: Get.width,
              height: Get.height * 0.15,
              decoration: const BoxDecoration(
                color: cPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: cPrimary,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: cWhite, width: 2),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/profile.jpg"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    spaceWidth(10),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width * 0.6,
                              child: Text(
                                // prefsC.isLoading.value
                                //     ? "..."
                                //     :
                                shortenLastName("Muhammad Rhomaedi"),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: customTextStyle(
                                    FontWeight.w700, 17, cWhite),
                              ),
                            ),
                            Text(
                              // prefsC.isLoading.value
                              //     ? "..."
                              //     : prefsC.jabatan.value,
                              "Staf Unit Sdm",
                              style: customTextStyle(
                                  FontWeight.w400, 14, cGrey_300),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.1),
            // color: Colors.amber,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: const [
                        BoxShadow(
                          color: cGrey_400,
                          blurRadius: 3,
                          offset: Offset(0, -1), // Shadow position
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Jadwal Hari Ini",
                                  style: customTextStyle(
                                      FontWeight.w900, 17, cBlack),
                                ),
                                spaceHeight(3),
                                Text(
                                  "09:00 -- 20:00",
                                  style: customTextStyle(
                                      FontWeight.w700, 13, cGrey_600),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              height: 40,
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
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: cWhite,
                                      size: 20,
                                    ),
                                    spaceWidth(5),
                                    Text(
                                      "Presensi",
                                      style: customTextStyle(
                                          FontWeight.w500, 14, cWhite),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0x2CFC1100)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              child: Text(
                                "STR anda akan segera berakhir pada 12-12-2024. Segera perbarui ke SDM.",
                                style:
                                    customTextStyle(FontWeight.w400, 13, cRed),
                              ),
                            ),
                          ),
                          spaceHeight(20),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: const [
                                BoxShadow(
                                  color: cGrey_400,
                                  blurRadius: 2,
                                  offset: Offset(-1, -1), // Shadow position
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  spaceHeight(5),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0x880088FF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons
                                                          .airplanemode_on_sharp,
                                                      size: 25,
                                                      color: Color(0xFF0133FA),
                                                    ),
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
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0x5D01D0A7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons
                                                          .change_circle_outlined,
                                                      size: 30,
                                                      color: Color(0xFF028066),
                                                    ),
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
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0x94FFBD07),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.timer_outlined,
                                                      size: 30,
                                                      color: Color(0xFF886401),
                                                    ),
                                                  ),
                                                ),
                                                spaceHeight(7),
                                                Text(
                                                  "Lembur",
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
                                          onTap: () {},
                                          child: SizedBox(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0x5BFF1C07),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            13),
                                                  ),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.edit_document,
                                                      size: 25,
                                                      color: Color(0xFF9C0D00),
                                                    ),
                                                  ),
                                                ),
                                                spaceHeight(7),
                                                Text(
                                                  "Approval",
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
                                    ],
                                  ),
                                  spaceHeight(13),
                                  Container(
                                    width: 50,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color: cGrey_300,
                                    ),
                                  ),
                                  spaceHeight(5),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          spaceHeight(20)
        ],
      ),
    );
    // return Scaffold(
    //   backgroundColor: cGrey_100,
    //   body: Obx(
    //     () => RefreshIndicator(
    //       onRefresh: () async {
    //         homeC.checkJadwal();
    //       },
    //       child: ListView(
    //         // crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [

    //           spaceHeight(heightStatusBar + 20),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Row(
    //                 children: [
    //                   Container(
    //                     width: 50,
    //                     height: 50,
    //                     decoration: BoxDecoration(
    //                       // color: cPrimary,
    //                       borderRadius: BorderRadius.circular(30),
    //                       border: Border.all(color: cPrimary, width: 2),
    //                       image: const DecorationImage(
    //                         image: AssetImage("assets/images/profile.jpg"),
    //                         fit: BoxFit.contain,
    //                       ),
    //                     ),
    //                   ),
    //                   spaceWidth(10),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       SizedBox(
    //                         width: Get.width * 0.6,
    //                         child: Text(
    //                           prefsC.isLoading.value
    //                               ? "..."
    //                               : shortenLastName(prefsC.nama.value),
    //                           maxLines: 1,
    //                           overflow: TextOverflow.ellipsis,
    //                           style:
    //                               customTextStyle(FontWeight.w700, 17, cBlack),
    //                         ),
    //                       ),
    //                       Text(
    //                         prefsC.isLoading.value
    //                             ? "..."
    //                             : prefsC.jabatan.value,
    //                         style: customTextStyle(FontWeight.w500, 14, cBlack),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               InkWell(
    //                 onTap: () {
    //                   homeC.checkJadwal();
    //                 },
    //                 child: Container(
    //                   width: 40,
    //                   height: 40,
    //                   decoration: const BoxDecoration(
    //                     color: cWhite,
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: cGrey_400,
    //                         blurRadius: 15,
    //                         offset: Offset(1, 1), // Shadow position
    //                       ),
    //                     ],
    //                     borderRadius: BorderRadius.all(
    //                       Radius.circular(5),
    //                     ),
    //                   ),
    //                   child: const Icon(
    //                     Icons.notifications,
    //                     size: 22,
    //                     color: cPrimary,
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           spaceHeight(30),
    //           Container(
    //             width: Get.width,
    //             decoration: BoxDecoration(
    //               color: cPrimary,
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             child: Padding(
    //               padding:
    //                   const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         "Jadwal hari ini",
    //                         style: customTextStyle(FontWeight.w500, 13, cWhite),
    //                       ),
    //                       Text(
    //                         homeC.isLoadingCheckJadwal.value
    //                             ? "..."
    //                             : homeC.isJadwal.value
    //                                 ? "Kosong"
    //                                 : "${homeC.shift.value} | ${homeC.jamMasuk.value} WIB -- ${homeC.jamPulang.value} WIB",
    //                         style: customTextStyle(FontWeight.w700, 17, cWhite),
    //                       ),
    //                     ],
    //                   ),
    //                   const Icon(
    //                     Icons.calendar_today_outlined,
    //                     color: cWhite,
    //                     size: 24,
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //           spaceHeight(25),
    //           cardMenu(),
    //           spaceHeight(25),
    //           Text(
    //             "Statistik Bulan ini",
    //             style: customTextStyle(FontWeight.w600, 15, cBlack),
    //           ),
    //           spaceHeight(15),
    //           homeC.isLoadingStatistik.value
    //               ? const Center(child: CircularProgressIndicator())
    //               : statistikBulanIni(
    //                   homeC.statistikModel?.data.list.tepat.val.toString(),
    //                   homeC.statistikModel?.data.list.telat.val.toString(),
    //                   homeC.statistikModel?.data.list.alpa.val.toString(),
    //                 ),
    //           // Center(
    //           //   child: Padding(
    //           //     padding: const EdgeInsets.only(top: 10),
    //           //     child: Text(
    //           //       "Coming Soon",
    //           //       style: customTextStyle(FontWeight.w500, 14, cGrey_600),
    //           //     ),
    //           //   ),
    //           // ),
    //           spaceHeight(15),
    //           Text(
    //             "Top Absensi",
    //             style: customTextStyle(FontWeight.w600, 15, cBlack),
    //           ),
    //           Center(
    //             child: Padding(
    //               padding: const EdgeInsets.only(top: 50),
    //               child: Text(
    //                 "Coming Soon",
    //                 style: customTextStyle(FontWeight.w500, 14, cGrey_600),
    //               ),
    //             ),
    //           ),
    //           // spaceHeight(15),
    //           // dataCards(),
    //           // spaceHeight(5),
    //           // dataCards(),
    //           // spaceHeight(5),
    //           // dataCards(),
    //           // spaceHeight(5),
    //           // dataCards(),
    //           // spaceHeight(5),
    //           // dataCards(),
    //           // spaceHeight(15),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
