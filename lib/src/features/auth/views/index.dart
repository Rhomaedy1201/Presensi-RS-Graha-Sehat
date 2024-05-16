import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/auth/controllers/login_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController loginC = Get.put(LoginController());
  bool _supportState = false;
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool emailActive = false;
  bool passActive = false;

  @override
  Widget build(BuildContext context) {
    double heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cWhite,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                          loginC.login();
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
    );
  }
}
