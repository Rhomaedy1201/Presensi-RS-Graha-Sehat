import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/lembur_controller.dart';

class LemburBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LemburController>(
      () => LemburController(),
    );
  }
}
