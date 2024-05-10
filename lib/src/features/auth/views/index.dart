import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/routes/route_name.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
        child: Column(
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
                  color: emailActive ? cPrimary_800 : cGrey_400,
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
                      keyboardType: TextInputType.emailAddress,
                      obscureText: _obscureText,
                      // controller: loginController.passwordController,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        hintText: "Masukkan Email",
                        hintStyle: TextStyle(
                          color: cGrey_700,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email, color: cPrimary_800),
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
                  color: passActive ? cPrimary_800 : cGrey_400,
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
                      // controller: loginController.passwordController,
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
            spaceHeight(25),
            SizedBox(
              width: Get.width,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cPrimary_800,
                  shadowColor: cPrimary_400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ), // Mengatur border radius menjadi 0
                  ),
                ),
                onPressed: () {
                  Get.offAllNamed(RouteNames.home);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
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
    );
  }
}
