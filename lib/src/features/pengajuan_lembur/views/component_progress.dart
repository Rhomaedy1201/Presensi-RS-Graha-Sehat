import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class ComponentProgressLembur extends StatefulWidget {
  const ComponentProgressLembur({super.key});

  @override
  State<ComponentProgressLembur> createState() =>
      _ComponentProgressLemburState();
}

class _ComponentProgressLemburState extends State<ComponentProgressLembur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cWhite,
            boxShadow: const [
              BoxShadow(
                color: cGrey_400,
                blurRadius: 15,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
          ),
          margin: const EdgeInsets.only(top: 15),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.telegram,
                          size: 25,
                          color: cPrimary,
                        ),
                        spaceWidth(7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "Muhammad Rhomaedi",
                                color: cBlack,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                            CustomText(
                                text: "05-11-2024",
                                color: cPrimary,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_drop_down_outlined,
                      size: 35,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
