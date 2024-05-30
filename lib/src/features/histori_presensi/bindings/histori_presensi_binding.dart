import 'package:get/get.dart';
import 'package:presensi_gs/src/features/histori_presensi/controllers/histori_presensi_controller.dart';

class HistoriPresensiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoriPresensiController>(() => HistoriPresensiController());
  }
}
