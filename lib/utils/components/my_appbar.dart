import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';

AppBar myAppBar(title) {
  return AppBar(
    backgroundColor: cPrimary,
    centerTitle: true,
    title: Text(
      title,
      style: customTextStyle(FontWeight.w500, 20, cBlack),
    ),
  );
}
