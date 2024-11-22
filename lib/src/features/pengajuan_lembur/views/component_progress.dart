import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';

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
          color: cGrey_200,
          margin: const EdgeInsets.only(top: 15),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text("22"),
          ),
        ),
      ),
    );
  }
}
