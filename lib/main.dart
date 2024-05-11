import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:presensi_gs/routes/route_page.dart';
import 'package:presensi_gs/src/features/splash_screen/views/index.dart';
import 'package:presensi_gs/utils/colors.dart';

Future<void> main() async {
  await initializeDateFormatting('id_ID', null).then((_) {
    // DepedencyInjection.init();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      defaultTransition: Transition.size,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cPrimary,
        ),
      ),
      home: const SplashScreen(),
      getPages: RoutePages.pages,
    );
  }
}
