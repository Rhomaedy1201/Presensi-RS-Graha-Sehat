import 'package:community_material_icon/community_material_icon.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/auth/controllers/login_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginC = Get.put(LoginController());
  bool _supportState = false;
  bool _obscureText = true;
  String deviceId = "Nan";
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    getDeviceId();
  }

  void getDeviceId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;
    final allInfo = deviceInfo.id;
    final prefs1 = await SharedPreferences.getInstance();
    final prefDeviceId = prefs1.getString('device_id');
    setState(() {
      deviceId = prefDeviceId == null ? allInfo : prefDeviceId.toString();
    });
  }

  bool emailActive = false;
  bool passActive = false;

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cWhite,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  spaceHeight(heightStatusBar),
                  SizedBox(
                    width: 180,
                    height: 180,
                    child: Image.asset('assets/icons/logo.png'),
                  ),
                  spaceHeight(20),
                  Container(
                    decoration: BoxDecoration(
                      color: cGrey_200,
                      border: Border.all(
                        width: 1.5,
                        color: emailActive ? cPrimary : cGrey_400,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            onTap: () {
                              setState(() {
                                emailActive = true;
                                passActive = false;
                              });
                            },
                            autocorrect: false,
                            maxLines: 1,
                            controller: loginC.nipController,
                            enableSuggestions: false,
                            decoration: const InputDecoration(
                              hintText: "Masukkan Nip",
                              hintStyle: TextStyle(
                                color: cGrey_700,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.person_2_rounded,
                                size: 28,
                                color: cPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceHeight(14),
                  Container(
                    decoration: BoxDecoration(
                      color: cGrey_200,
                      border: Border.all(
                        width: 1.5,
                        color: passActive ? cPrimary : cGrey_400,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            onTap: () {
                              setState(() {
                                emailActive = false;
                                passActive = true;
                              });
                            },
                            autocorrect: false,
                            maxLines: 1,
                            obscureText: _obscureText,
                            controller: loginC.passwordController,
                            enableSuggestions: false,
                            decoration: InputDecoration(
                              hintText: "Masukkan Password",
                              hintStyle: const TextStyle(
                                color: cGrey_700,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                child: Icon(
                                  _obscureText
                                      ? CommunityMaterialIcons.eye_off_outline
                                      : CommunityMaterialIcons.eye_outline,
                                  size: 26,
                                  color: cGrey_700,
                                ),
                                onTap: () {
                                  _toggle();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  spaceHeight(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "DEVICE-ID : ",
                            style: customTextStyle(FontWeight.w400, 12, cBlack),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            deviceId.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: cBlack,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          print("Lupa Password");
                        },
                        child: Text(
                          "Lupa password?",
                          style: customTextStyle(FontWeight.w400, 12, cPrimary),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                  spaceHeight(30),
                  SizedBox(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cPrimary,
                        shadowColor: cPrimary_400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ), // Mengatur border radius menjadi 0
                        ),
                      ),
                      onPressed: loginC.isLoading.value
                          ? null
                          : () {
                              loginC.login(deviceId);
                            },
                      child: Text(
                        loginC.isLoading.value ? "Loading..." : "Login",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: cWhite,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
