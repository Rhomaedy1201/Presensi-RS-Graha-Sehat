import 'package:http/http.dart' as http;
import 'package:presensi_gs/src/features/home/views/upadate_version.dart';
import '../components/imported_package.dart';

class HomeController extends GetxController {
  DashboardStatistikModel? statistikModel;
  RxMap profileData = {}.obs;
  RxMap dataPresensiHarian = {}.obs;
  RxList dataJadwalHarian = [].obs;
  RxList dataVersionUpdated = [].obs;
  var isLoadingCheckJadwal = false.obs;
  var isLoadingStatistik = false.obs;
  var isLoadingStr = false.obs;
  var isLoadingUser = false.obs;
  var isLoadingLembur = false.obs;
  var shift = "".obs;
  var jamMasuk = "".obs;
  var jamPulang = "".obs;
  var isJadwal = false.obs;
  var isEmptyStr = true.obs;
  var tglStr = "".obs;

  Rx<DateTime>? ntpTime;
  Rx<DateTime>? initialFetchTime;
  Rx<Timer>? timer;
  RxBool isLoadingTime = true.obs;
  // user

  @override
  void onInit() {
    super.onInit();
    checkJadwal();
    getStatistik();
    getStr();
    getProfile();
    fetchNtpTime();
    getJadwalHarian();
    getUpdatedVersionMobile();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   checkJadwal();
  //   getStatistik();
  //   getStr();
  //   getProfile();
  // }

  Future<void> checkJadwal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingCheckJadwal(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/presensi/check-jadwal"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        isJadwal(false);
        shift.value = json['data']['shift'];
        jamMasuk.value = json['data']['jam_masuk'];
        jamPulang.value = json['data']['jam_pulang'];
      } else {
        isJadwal(true);
        debugPrint("Terjadi kesalahan get data jadwal");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingCheckJadwal(false);
    }
  }

  Future<void> getStatistik() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingStatistik(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/statistik-presensi"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        statistikModel = DashboardStatistikModel.fromJson(json);
      } else {
        debugPrint("Terjadi kesalahan get data Str");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingStatistik(false);
    }
  }

  Future<void> getStr() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingStr(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/str"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        if (json['data']['show'] == false) {
          isEmptyStr(true);
        } else {
          isEmptyStr(false);
          tglStr.value = json['data']['tgl_akhir'];
        }
      } else {
        debugPrint("Terjadi kesalahan get data Str");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      isLoadingStr(false);
    }
  }

  Future<void> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingUser(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/my-profil"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        profileData.value = json['data'];
      } else {
        debugPrint("Terjadi kesalahan get data User");
      }
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingUser(false);
    }
  }

  Future<void> getJadwalHarian() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingLembur(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/dashboard/jadwal/harian"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataPresensiHarian.value = json['data'];
        dataJadwalHarian.value = dataPresensiHarian['jadwal'];
      } else {
        debugPrint("Terjadi kesalahan get data presensi harian");
      }
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingLembur(false);
    }
  }

  Future<void> getUpdatedVersionMobile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    try {
      isLoadingLembur(true);
      if (token == null) {
        throw Exception("Token not found");
      }

      http.Response response = await http.get(
        Uri.parse("$base_url/updated_version_mobile"),
        headers: headers,
      );

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        dataVersionUpdated.value = json['data'];
        if (dataVersionUpdated.isNotEmpty) {
          updatedVersion(dataVersionUpdated[0]['version'], dataVersionUpdated[0]['ket'],dataVersionUpdated[0]['source_link']);
        }
      } else {
        debugPrint("Terjadi kesalahan get data updated version mobile");
      }
    } catch (e) {
      print(e.toString()); // Mengembalikan error dalam Map
    } finally {
      isLoadingLembur(false);
    }
  }

  Future<void> fetchNtpTime() async {
    try {
      DateTime networkTime = await NTP.now();
      ntpTime = networkTime.toLocal().obs;
      // initialFetchTime = DateTime.now().toUtc().obs;
      isLoadingTime(false);
      _startTimer();
    } catch (e) {
      isLoadingTime(false);
      print('Error fetching NTP time: $e');
    }
  }

  void _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ntpTime != null && initialFetchTime != null) {
        ntpTime!.value = initialFetchTime!.value.add(
          Duration(seconds: timer.tick),
        );
      }
    }).obs;
  }

  String getGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 7 && hour < 10) {
      return "Selamat Pagi";
    } else if (hour >= 10 && hour < 14) {
      return "Selamat Siang";
    } else if (hour >= 14 && hour < 18) {
      return "Selamat Sore";
    } else if (hour >= 18 || hour < 7) {
      return "Selamat Malam";
    } else {
      return "Halo";
    }
  }
}
