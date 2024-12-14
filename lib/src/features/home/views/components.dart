import 'package:presensi_gs/src/features/home/components/presensi_lembur.dart';
import 'package:presensi_gs/src/features/home/components/submission_card.dart';
import 'package:presensi_gs/src/features/home/controllers/code_blue_and_red_controller.dart';
import '../components/imported_package.dart';

class ComponentHome extends StatefulWidget {
  const ComponentHome({super.key});

  @override
  State<ComponentHome> createState() => _ComponentHomeState();
}

class _ComponentHomeState extends State<ComponentHome> {
  bool kodeRed = false;
  bool kodeBlue = false;
  CodeBlueAndRedController codeBlueRed = Get.find<CodeBlueAndRedController>();
  HomeController homeC = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!codeBlueRed.isEmptyDataRed.value)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: codeRed(
                codeBlueRed.bagianRed.value,
                codeBlueRed.shiftRed.value,
                codeBlueRed.zonaRed.value,
              ),
            ),
          if (!codeBlueRed.isEmptyDataBlue.value)
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: codeBlue(
                codeBlueRed.bagianBlue.value,
                codeBlueRed.shiftBlue.value,
              ),
            ),
          if (!codeBlueRed.isEmptyDataRed.value ||
              !codeBlueRed.isEmptyDataBlue.value)
            spaceHeight(10),
          spaceHeight(5),
          homeC.dataPresensiHarian['lembur'] == null ? Container() : 
          Column(
            children: [
              overTimeCard(homeC),
              spaceHeight(12),
            ],
          ),
          
          submissionCard(context)
        ],
      ),
    );
  }

  Widget codeRed(bagian, shift, zone) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cWhite,
            boxShadow: const [
              BoxShadow(
                color: cGrey_400,
                blurRadius: 10,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          CommunityMaterialIcons.fire,
                          color: cRed,
                          size: 18,
                        ),
                        spaceWidth(4),
                        Text(
                          "Code Red",
                          style: customTextStyle(
                            FontWeight.w800,
                            11,
                            cRed,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        kodeRed = !kodeRed;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: cWhite,
                          boxShadow: const [
                            BoxShadow(
                              color: cGrey_500,
                              blurRadius: 10,
                              offset: Offset(0, 0), // Shadow position
                            ),
                          ],
                        ),
                        child: Icon(
                          kodeRed ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                        ),
                      ),
                    ),
                  ],
                ),
                kodeRed
                    ? Column(
                        children: [
                          spaceHeight(5),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_300,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Bagian : ",
                                        style: customTextStyle(
                                          FontWeight.w600,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                      Text(
                                        bagian == "" ? "...." : bagian,
                                        style: customTextStyle(
                                          FontWeight.w400,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceHeight(5),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_300,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Shift : ",
                                        style: customTextStyle(
                                          FontWeight.w600,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                      Text(
                                        shift == "" ? "...." : shift,
                                        style: customTextStyle(
                                          FontWeight.w400,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceHeight(5),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_300,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Zone : ",
                                        style: customTextStyle(
                                          FontWeight.w600,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                      Text(
                                        zone == "" ? "...." : zone,
                                        style: customTextStyle(
                                          FontWeight.w400,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget codeBlue(bagian, shift) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 350),
      curve: Curves.linear,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: cWhite,
            boxShadow: const [
              BoxShadow(
                color: cGrey_500,
                blurRadius: 10,
                offset: Offset(0, 3), // Shadow position
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          CommunityMaterialIcons.fire,
                          color: Colors.blue,
                          size: 18,
                        ),
                        spaceWidth(4),
                        Text(
                          "Code Blue",
                          style: customTextStyle(
                            FontWeight.w800,
                            11,
                            Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        kodeBlue = !kodeBlue;
                        setState(() {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: cWhite,
                          boxShadow: const [
                            BoxShadow(
                              color: cGrey_500,
                              blurRadius: 10,
                              offset: Offset(0, 0), // Shadow position
                            ),
                          ],
                        ),
                        child: Icon(
                          kodeBlue
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                      ),
                    ),
                  ],
                ),
                kodeBlue
                    ? Column(
                        children: [
                          spaceHeight(5),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_300,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Bagian : ",
                                        style: customTextStyle(
                                          FontWeight.w600,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                      Text(
                                        bagian == "" ? "...." : bagian,
                                        style: customTextStyle(
                                          FontWeight.w400,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          spaceHeight(5),
                          Container(
                            width: Get.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: cGrey_300,
                                width: 1.5,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Shift : ",
                                        style: customTextStyle(
                                          FontWeight.w600,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                      Text(
                                        shift == "" ? "...." : shift,
                                        style: customTextStyle(
                                          FontWeight.w400,
                                          10,
                                          cBlack,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
