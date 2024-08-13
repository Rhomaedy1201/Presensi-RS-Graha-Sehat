import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCheck extends GetxController {
  SharedPreferences? prefs;
  check() async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs?.getString("token");
    if (token != null) {
      // Get.offAllNamed(RouteNames.home);
      Get.offAllNamed(RouteNames.navigationBar);
    } else {
      Get.offAllNamed(RouteNames.login);
    }
  }
}
