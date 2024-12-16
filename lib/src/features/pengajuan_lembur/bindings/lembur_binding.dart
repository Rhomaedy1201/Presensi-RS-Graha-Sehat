import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/confirm_lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/presensi_lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/progress_lembur_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/selesai_lembur_controller.dart';

class LemburBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LemburController>(
      () => LemburController(),
    );
    Get.lazyPut<ProgressLemburController>(
      () => ProgressLemburController(),
    );
    Get.lazyPut<ConfirmLemburController>(
      () => ConfirmLemburController(),
    );
    Get.lazyPut<SelesaiLemburController>(
      () => SelesaiLemburController(),
    );
    Get.lazyPut<PresensiLemburController>(
      () => PresensiLemburController(),
    );
  }
}
