import 'package:get/get.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/pengajuan_izin_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/controllers/progress_izin_controller.dart';

class PerizinanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengajuanIzinController>(() => PengajuanIzinController());
    Get.lazyPut<ProgressIzinController>(() => ProgressIzinController());
  }
}
