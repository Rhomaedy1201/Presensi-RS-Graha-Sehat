import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/auth/views/index.dart';
import 'package:presensi_gs/src/features/home/views/index.dart';
import 'package:presensi_gs/src/features/jadwal/views/index.dart';
import 'package:presensi_gs/src/features/navigation_bar/views/index.dart';
import 'package:presensi_gs/src/features/splash_screen/views/index.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: RouteNames.navigationBarView,
      page: () => const NavigationBarView(),
    ),
    GetPage(
      name: RouteNames.jadwal,
      page: () => const JadwalView(),
    ),
    GetPage(
      name: RouteNames.historiPresensi,
      page: () => const JadwalView(),
    ),
  ];
}
