import 'package:get/get.dart';
import 'package:presensi_gs/src/features/jadwal/controllers/jadwal_controller.dart';

class JadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalController>(() => JadwalController());
  }
}
