import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';

class MyAlert {
  static void show({
    required String title,
    required String msg,
    required VoidCallback onOke,
    required VoidCallback onCancel,
    bool isTouch = true,
    required BuildContext context,
  }) {
    if (GetPlatform.isAndroid) {
      Get.defaultDialog(
        title: title,
        backgroundColor: cWhite,
        radius: 10,
        barrierDismissible: isTouch,
        titleStyle: customTextStyle(FontWeight.w500, 18, cBlack),
        titlePadding: const EdgeInsets.only(top: 15),
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        content: Column(
          children: [
            Text(
              msg,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onCancel,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: cGrey_500,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        "Batal",
                        style: customTextStyle(FontWeight.w500, 12, cBlack),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: onOke,
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.transparent,
                        primary: cPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        "OK",
                        style: customTextStyle(FontWeight.w500, 12, cBlack),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else if (GetPlatform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: onCancel,
              child: Text(
                'Batal',
                style: customTextStyle(FontWeight.w500, 14, cRed),
              ),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: onOke,
              child: Text(
                'Oke',
                style: customTextStyle(FontWeight.w500, 14, cBlack),
              ),
            ),
          ],
        ),
      );
    }
  }
}
