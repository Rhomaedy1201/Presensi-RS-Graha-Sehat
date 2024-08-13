import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/src/features/home/controllers/prefs_controller.dart';
import 'package:presensi_gs/src/features/profile/controllers/profile_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_alert.dart';
import 'package:presensi_gs/utils/components/my_appbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController profileC = Get.put(ProfileController());
  PrefsController prefsC = Get.put(PrefsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey_200,
      appBar: myAppBar("Profile"),
      body: Obx(
        () => profileC.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      spaceHeight(50),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: cGrey_400,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: cPrimary, width: 4),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      spaceHeight(10),
                      Text(
                        profileC.userM?.nama ?? "...",
                        style: customTextStyle(FontWeight.w700, 16, cBlack),
                      ),
                      Text(
                        prefsC.isLoading.value ? "..." : prefsC.jabatan.value,
                        style: customTextStyle(FontWeight.w500, 12, cBlack),
                      ),
                      spaceHeight(40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            changePasswordMenu(),
                            logoutMenu(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  GestureDetector changePasswordMenu() {
    return GestureDetector(
      onTap: () {
        debugPrint("change password");
      },
      child: Container(
        width: Get.width,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: cGrey_400, width: 0.6),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBEBEB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Icon(
                        CommunityMaterialIcons.lock_reset,
                        size: 20,
                      ),
                    ),
                  ),
                  spaceWidth(15),
                  Text(
                    "Ubah Password",
                    style: customTextStyle(FontWeight.w500, 13, cBlack),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 18,
                color: cBlack,
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector logoutMenu() {
    return GestureDetector(
      onTap: () {
        MyAlert.show(
          title: "Peringatan!",
          msg: "Apakah anda ingin logout?",
          onOke: () {
            profileC.logout();
          },
          onCancel: () => Get.back(),
          context: context,
        );
      },
      child: SizedBox(
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: cRed_100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Icon(
                    CommunityMaterialIcons.lock_reset,
                    size: 20,
                    color: cRed,
                  ),
                ),
              ),
              spaceWidth(15),
              Text(
                "Logout",
                style: customTextStyle(FontWeight.w500, 13, cRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
