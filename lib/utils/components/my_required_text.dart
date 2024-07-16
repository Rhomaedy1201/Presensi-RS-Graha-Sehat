import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

Widget requiredText(text, weight, double sizeText, color) {
  return Row(
    children: [
      Text(
        text,
        style: customTextStyle(weight, sizeText, color),
      ),
      spaceWidth(3),
      Text(
        "*",
        style: customTextStyle(FontWeight.w600, 12, cRed),
      ),
    ],
  );
}
