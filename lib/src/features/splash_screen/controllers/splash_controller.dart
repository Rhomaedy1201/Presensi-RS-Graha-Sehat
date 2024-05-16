import 'dart:async';

import 'package:get/get.dart';
import 'package:presensi_gs/src/features/auth/controllers/login_check.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    onCheck();
  }

  onCheck() {
    Timer(const Duration(seconds: 3), () {
      LoginCheck().check();
    });
  }
}
