import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:presensi_gs/src/features/home/views/index.dart';
import 'package:presensi_gs/utils/colors.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  DateTime timeBackPresed = DateTime.now();
  int selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    Text("data"),
    Text("data"),
    Text("data"),
    Text("data"),
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
    // prefsC.addPrefs();
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onPop,
        child: Scaffold(
          body: Center(
            child: _widgetOptions.elementAt(selectedIndex),
          ),
          bottomNavigationBar: NavigationBar(
            height: 75,
            elevation: 0,
            selectedIndex: selectedIndex,
            indicatorColor: cPrimary,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            onDestinationSelected: _onItemTapped,
            destinations: const [
              NavigationDestination(
                icon: Icon(CommunityMaterialIcons.home),
                label: "Home",
                selectedIcon: Icon(
                  CommunityMaterialIcons.home,
                  color: cWhite,
                ),
              ),
              NavigationDestination(
                icon: Icon(CommunityMaterialIcons.alarm, size: 27),
                label: "Jadwal",
                selectedIcon: Icon(
                  CommunityMaterialIcons.alarm,
                  size: 27,
                  color: cWhite,
                ),
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined),
                label: "Perijinan",
                selectedIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: cWhite,
                ),
              ),
              NavigationDestination(
                icon: Icon(CommunityMaterialIcons.file_document_outline),
                label: "Histori",
                selectedIcon: Icon(
                  CommunityMaterialIcons.file_document_outline,
                  color: cWhite,
                ),
              ),
              NavigationDestination(
                icon: Icon(CommunityMaterialIcons.account_outline),
                label: "Profile",
                selectedIcon: Icon(
                  CommunityMaterialIcons.account_outline,
                  color: cWhite,
                ),
              ),
            ],
          ),
        ),
      );
}
