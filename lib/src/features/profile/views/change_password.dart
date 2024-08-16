import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/profile/controllers/profile_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _obscureText = true;
  ProfileController profileC = Get.find<ProfileController>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool passActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Change Password"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Password Baru",
              style: customTextStyle(FontWeight.w600, 12, cGrey_600),
            ),
            spaceHeight(7),
            Container(
              // height: 50,
              decoration: BoxDecoration(
                color: cGrey_200,
                border: Border.all(
                  width: 1.5,
                  color: passActive ? cPrimary : cGrey_400,
                ),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      onTap: () {
                        setState(() {
                          passActive = true;
                        });
                      },
                      autocorrect: false,
                      maxLines: 1,
                      obscureText: _obscureText,
                      controller: profileC.passwordController,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        hintText: "Masukkan password",
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
            spaceHeight(20),
            SizedBox(
              width: Get.width,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: cPrimary,
                  shadowColor: cPrimary_400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      6,
                    ), // Mengatur border radius menjadi 0
                  ),
                ),
                onPressed: () {
                  profileC.changePassword();
                },
                child: Text(
                  profileC.isLoadingPass.value ? "Loading..." : "Ubah Password",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
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
