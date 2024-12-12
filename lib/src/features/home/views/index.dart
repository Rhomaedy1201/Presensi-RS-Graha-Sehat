import 'package:presensi_gs/src/features/home/components/activity_menu.dart';
import 'package:presensi_gs/src/features/home/components/user_heading.dart';
import '../components/imported_package.dart';

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
    var heighStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cGrey_200,
      body: Obx(
        () => Stack(
          children: [
            componentUser(
              homeC.profileM?.data.nama ?? "null",
              homeC.profileM?.data.namaJabatan ?? "null",
              homeC.profileM?.data.profilUrl ?? "null",
              heighStatusBar,
              homeC,
            ),
            activityMenu(homeC),
          ],
        ),
      ),
    );
  }
}
