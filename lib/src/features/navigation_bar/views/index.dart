import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/histori_presensi/views/index.dart';
import 'package:presensi_gs/src/features/home/controllers/home_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/home/views/index.dart';
import 'package:presensi_gs/src/features/jadwal/views/index.dart';
import 'package:presensi_gs/src/features/profile/views/index.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_dialog.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  HomeController homeC = Get.find<HomeController>();
  PrefsController prefsC = Get.find<PrefsController>();

  DateTime timeBackPresed = DateTime.now();
  int selectedIndex = 0;
  int previewSelectedIndex = 0;

  static List<Widget> widgetOptions = <Widget>[
    const HomeView(),
    const JadwalView(),
    const Text("pengajuan"),
    const HistoriPresensiView(),
    Text(
      "Approval masih dalam proses\npengembangan.",
      textAlign: TextAlign.center,
      style: customTextStyle(FontWeight.w400, 17, cBlack),
    ),
  ];

  Future<bool> onPop() async {
    final diference = DateTime.now().difference(timeBackPresed);
    final isExitWaring = diference >= const Duration(seconds: 2);

    timeBackPresed = DateTime.now();

    if (isExitWaring) {
      Fluttertoast.showToast(
        msg: "Tekan Lagi untuk Keluar",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0x8A272727),
        textColor: cBlack,
      );
      return false;
    } else {
      Fluttertoast.cancel();
      return true;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if (selectedIndex == 2) {
      showPopupMenu(context);
      selectedIndex = previewSelectedIndex;
    } else {
      previewSelectedIndex = index;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onPop,
        child: Scaffold(
          backgroundColor: cGrey_200,
          body: Center(
            child: widgetOptions.elementAt(selectedIndex),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingActionBottom(context),
          bottomNavigationBar: buttomNavigation(),
        ),
      );

  BottomNavigationBar buttomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.home_variant_outline),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CommunityMaterialIcons.calendar_account_outline),
          label: 'Jadwal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,
              size: 40, color: Colors.transparent), // Icon Pengajuan
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Histori',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.approval),
          label: 'Approval',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: cPrimary,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      iconSize: 22,
      selectedLabelStyle: customTextStyle(FontWeight.w500, 10, cRed),
      unselectedLabelStyle: customTextStyle(FontWeight.w500, 10, cRed),
    );
  }

  void showPopupMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: cWhite,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          height: 210,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                spaceHeight(5),
                Container(
                  width: 100,
                  height: 5,
                  decoration: BoxDecoration(
                    color: cGrey_500,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                spaceHeight(25),
                InkWell(
                  onTap: () => Get.toNamed(RouteNames.perizinanView),
                  child: Container(
                    color: cGrey_200,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 40,
                          color: cPrimary,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.airplanemode_on_sharp, size: 22),
                        ),
                        Text(
                          'Perizinan',
                          style:
                              customTextStyle(FontWeight.w500, 13, cGrey_900),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceHeight(10),
                InkWell(
                  onTap: () => Get.toNamed(RouteNames.tukarShift),
                  child: Container(
                    color: cGrey_200,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 40,
                          color: cPrimary,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.change_circle_outlined, size: 22),
                        ),
                        Text(
                          'Tukar Shift',
                          style:
                              customTextStyle(FontWeight.w500, 13, cGrey_900),
                        ),
                      ],
                    ),
                  ),
                ),
                spaceHeight(10),
                InkWell(
                  onTap: () {
                    dialogComingSoon("Lembur");
                  },
                  child: Container(
                    color: cGrey_200,
                    child: Row(
                      children: [
                        Container(
                          width: 3,
                          height: 40,
                          color: cPrimary,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Icon(Icons.timer_outlined, size: 22),
                        ),
                        Text(
                          'Lembur',
                          style:
                              customTextStyle(FontWeight.w500, 13, cGrey_900),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget floatingActionBottom(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 110,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 27),
            width: 60,
            height: 60,
            child: Material(
              type: MaterialType.transparency,
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 4),
                  color: cPrimary,
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(500.0),
                  onTap: () {
                    showPopupMenu(context);
                  },
                  child: const Icon(
                    CommunityMaterialIcons.file_document_edit_outline,
                    size: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          spaceHeight(5),
          Text(
            "Pengajuan",
            style: customTextStyle(FontWeight.w500, 10, Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
