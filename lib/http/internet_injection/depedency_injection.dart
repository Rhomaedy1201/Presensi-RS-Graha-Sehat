import 'package:get/get.dart';
import 'package:presensi_gs/http/internet_injection/controllers/network_controller.dart';

class DepedencyInjection {
  static Future<void> init() async {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
