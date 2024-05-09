import 'dart:async';

import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    onCheck();
  }

  onCheck() {
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(RouteNames.navigationBarView);
    });
  }
}
