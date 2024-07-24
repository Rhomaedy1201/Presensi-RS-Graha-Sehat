import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/progress_ts_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/controllers/tukar_shift_controller.dart';

class TukarShiftBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrefsController>(() => PrefsController());
    Get.lazyPut<TukarJadwalController>(() => TukarJadwalController());
    Get.lazyPut<ProgressTukarShiftController>(
      () => ProgressTukarShiftController(),
    );
  }
}
