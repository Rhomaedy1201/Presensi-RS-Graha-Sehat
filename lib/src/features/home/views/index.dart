import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/home/controllers/home_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/home/views/components.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_dialog.dart';
import 'package:presensi_gs/utils/components/my_menu_home.dart';
import 'package:presensi_gs/utils/components/my_shimmer.dart';
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

  bool kodeRedShow = false;
  bool kodeBlueShow = false;

  @override
  void initState() {
    super.initState();
    homeC.getProfile();
  }

  @override
  void dispose() {
    homeC.getProfile();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: AppBar(
        backgroundColor: cPrimary,
        toolbarHeight: 80,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Container(
            width: 135,
            height: 30,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icons/logo3.png"),
                fit: BoxFit.contain,
              ),
            ),
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
      body: Obx(
        () => Stack(
          children: [
            componentUser(
              homeC.profileM?.data.nama ?? "null",
              homeC.profileM?.data.namaJabatan ?? "null",
              homeC.profileM?.data.profilUrl ?? "null",
            ),
            Container(
              margin: EdgeInsets.only(top: Get.height * 0.095),
              // color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: cWhite,
                        borderRadius: BorderRadius.circular(15),
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
                                    onTap: () =>
                                        Get.toNamed(RouteNames.perizinanView),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0x880088FF),
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.airplanemode_on_sharp,
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
                                    onTap: () =>
                                        Get.toNamed(RouteNames.tukarShift),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0x5D01D0A7),
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                            ),
                                            child: const Center(
                                              child: Icon(
                                                Icons.change_circle_outlined,
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
                                    onTap: () =>
                                        Get.toNamed(RouteNames.pengajuanLembur),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0x94FFBD07),
                                              borderRadius:
                                                  BorderRadius.circular(13),
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
                                    onTap: () => dialogComingSoon("Approval"),
                                    child: SizedBox(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: const Color(0x5BFF1C07),
                                              borderRadius:
                                                  BorderRadius.circular(13),
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
                  ),
                  // Container(
                  //   height: 20,
                  // ),
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
                              homeC.isEmptyStr.value
                                  ? Container()
                                  : spaceHeight(10),
                              homeC.isLoadingStr.value
                                  ? Container()
                                  : homeC.isEmptyStr.value
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 25,
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: Get.width,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color(
                                                        0x2CFC1100)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 10),
                                                  child: Text(
                                                    "STR anda akan segera berakhir pada ${homeC.tglStr}. Segera perbarui ke SDM.",
                                                    style: customTextStyle(
                                                        FontWeight.w500,
                                                        11,
                                                        cRed),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                              ComponentHome(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 25),
                                child: componentCardPresensi(),
                              ),
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
            ),
          ],
        ),
      ),
    );
  }

  Container componentCardPresensi() {
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
                                : "${homeC.statistikModel?.data.list.tepat.val}",
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
                                : "${homeC.statistikModel?.data.list.telat.val}",
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
                                : "${homeC.statistikModel?.data.list.alpa.val}",
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

  ClipPath componentUser(name, jabatan, image) {
    return ClipPath(
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Column(
            children: [
              SizedBox(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: cGrey_200,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: cWhite, width: 2),
                        image: image == "null"
                            ? const DecorationImage(
                                image: AssetImage("assets/images/profile.jpg"),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    spaceWidth(10),
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            homeC.isLoadingUser.value
                                ? myShimmer(Get.width * 0.6, 20)
                                : SizedBox(
                                    width: Get.width * 0.6,
                                    child: Text(
                                      name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customTextStyle(
                                          FontWeight.w700, 17, cWhite),
                                    ),
                                  ),
                            homeC.isLoadingUser.value
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: myShimmer(Get.width * 0.3, 12),
                                  )
                                : Text(
                                    jabatan,
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
            ],
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
