import 'package:get/get.dart';
import 'package:presensi_gs/src/features/attendence/controllers/presensi_controller.dart';

class PresensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresensiController>(() => PresensiController());
  }
}
