import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/futures/auth/views/index.dart';
import 'package:presensi_gs/src/futures/home/views/index.dart';
import 'package:presensi_gs/src/futures/splash_screen/views/index.dart';

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
  ];
}
