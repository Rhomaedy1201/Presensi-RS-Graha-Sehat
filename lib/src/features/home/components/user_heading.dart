import 'imported_package.dart';

ClipPath componentUser(
    name, jabatan, image, heighStatusBar, HomeController homeC) {
  return ClipPath(
    child: Stack(
      children: [
        Container(
          width: Get.width,
          height: Get.height * 0.45,
          decoration: const BoxDecoration(
            color: cPrimary_dark,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            width: Get.width,
            height: Get.height * 0.425,
            decoration: const BoxDecoration(
              color: cPrimary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 30, right: 30, top: heighStatusBar + 25),
              child: Column(
                children: [
                  SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                                text: "${homeC.getGreeting()},",
                                color: cGrey_300,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            spaceHeight(3),
                            homeC.isLoadingUser.value
                                ? myShimmer(Get.width * 0.6, 20)
                                : SizedBox(
                                    width: Get.width * 0.6,
                                    child: Text(
                                      name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: customTextStyle(
                                          FontWeight.w700, 20, cWhite),
                                    ),
                                  ),
                            homeC.isLoadingUser.value
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: myShimmer(Get.width * 0.3, 13),
                                  )
                                : Text(
                                    jabatan,
                                    style: customTextStyle(
                                        FontWeight.w500, 13, cGrey_300),
                                  ),
                          ],
                        ),
                        Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            color: cGrey_200,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: cWhite, width: 1),
                            image: image == "null"
                                ? const DecorationImage(
                                    image:
                                        AssetImage("assets/images/profile.jpg"),
                                    fit: BoxFit.cover,
                                  )
                                : DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  spaceHeight(20),
                  presenceCard(homeC),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Container presenceCard(HomeController homeC) {
  return Container(
    width: Get.width,
    decoration: BoxDecoration(
      color: cWhite,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: cPrimary_dark,
          blurRadius: 3,
          offset: Offset(0, 4), // Shadow position
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                  text: "Hari ini, ${DateTime.now().fullDateAll()}",
                  color: cGrey_600,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
              homeC.isLoadingTime.value
                  ? myShimmer(Get.width * 0.3, 13)
                  : Container(),
              homeC.ntpTime != null
                  ? CustomText(
                      text: homeC.ntpTime!.value.getTimeSecond(),
                      color: cGrey_600,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)
                  : CustomText(
                      text: DateTime.now().getTime(),
                      color: cGrey_600,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
            ],
          ),
          spaceHeight(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0x4506AB95),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.check_circle,
                        size: 28,
                        color: cPrimary_dark,
                      ),
                    ),
                  ),
                  spaceWidth(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Masuk",
                          color: cGrey_900,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      CustomText(
                          text: "08:57",
                          color: cBlack,
                          fontSize: 22,
                          fontWeight: FontWeight.w700),
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 25,
                child: Image.asset("assets/icons/arrow_right.png"),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cGrey_300,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.check_circle,
                        size: 28,
                        color: cGrey_500,
                      ),
                    ),
                  ),
                  spaceWidth(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: "Pulang",
                          color: cGrey_500,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: CustomText(
                            text: "--:--",
                            color: cGrey_500,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          spaceHeight(17),
          SizedBox(
            width: Get.width / 1.4,
            height: 35,
            child: ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: cPrimary_dark,
                shadowColor: cPrimary,
                elevation: 5,
              ),
              child: CustomText(
                  text: "Presensi Masuk",
                  color: cWhite,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
          spaceHeight(3)
        ],
      ),
    ),
  );
}