import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/src/features/approval/views/detail_pengajuan.dart';
import 'package:presensi_gs/src/features/approval/views/index.dart';
import 'package:presensi_gs/src/features/attendence/bindings/presensi_binding.dart';
import 'package:presensi_gs/src/features/attendence/views/index.dart';
import 'package:presensi_gs/src/features/auth/bindings/login_binding.dart';
import 'package:presensi_gs/src/features/auth/views/index.dart';
import 'package:presensi_gs/src/features/histori_presensi/bindings/histori_presensi_binding.dart';
import 'package:presensi_gs/src/features/histori_presensi/views/index.dart';
import 'package:presensi_gs/src/features/home/bindings/home_binding.dart';
import 'package:presensi_gs/src/features/home/views/index.dart';
import 'package:presensi_gs/src/features/jadwal/bindings/jadwal_binding.dart';
import 'package:presensi_gs/src/features/jadwal/views/index.dart';
import 'package:presensi_gs/src/features/navigation_bar/views/index.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/bindings/lembur_binding.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/views/index.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/bindings/perizinan_binding.dart';
import 'package:presensi_gs/src/features/pengajuan_perizinan/views/index.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/bindings/tukar_shift_binding.dart';
import 'package:presensi_gs/src/features/pengajuan_tukar_shift/views/index.dart';
import 'package:presensi_gs/src/features/profile/bindings/profile_binding.dart';
import 'package:presensi_gs/src/features/profile/views/index.dart';
import 'package:presensi_gs/src/features/splash_screen/views/index.dart';

class RoutePages {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
      // binding: SplashBinding(),
    ),
    GetPage(
      name: RouteNames.navigationBar,
      page: () => const NavigationBarView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteNames.navigationBarView,
      page: () => const NavigationBarView(),
    ),
    GetPage(
      name: RouteNames.jadwal,
      page: () => const JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: RouteNames.historiPresensi,
      page: () => const HistoriPresensiView(),
      binding: HistoriPresensiBinding(),
    ),
    GetPage(
      name: RouteNames.presensi,
      page: () => const PresensiView(),
      binding: PresensiBinding(),
    ),
    GetPage(
      name: RouteNames.tukarShift,
      page: () => const TukarShiftView(),
      binding: TukarShiftBinding(),
    ),
    GetPage(
      name: RouteNames.profileView,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouteNames.perizinanView,
      page: () => const PerizinanView(),
      binding: PerizinanBinding(),
    ),
    GetPage(
      name: RouteNames.approvalView,
      page: () => const ApprovalView(),
    ),
    GetPage(
      name: RouteNames.detailPengajuanView,
      page: () => const DetailPengajuanView(),
    ),
    GetPage(
      name: RouteNames.pengajuanLembur,
      page: () => const PengajuanLembur(),
      binding: LemburBinding(),
    ),
  ];
}
