import 'package:get/get.dart';
import 'package:presensi_gs/src/features/attendence/controllers/presensi_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/code_blue_and_red_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/home_controller.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PrefsController>(() => PrefsController());
    Get.lazyPut<CodeBlueAndRedController>(() => CodeBlueAndRedController());
    Get.lazyPut<PresensiController>(() => PresensiController());
  }
}
