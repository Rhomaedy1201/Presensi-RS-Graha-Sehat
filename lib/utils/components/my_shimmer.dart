import 'package:flutter/material.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

Widget myShimmer(double width, double height) {
  return Shimmer.fromColors(
    baseColor: cGrey_400,
    highlightColor: cGrey_100,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: cGrey_500,
        borderRadius: BorderRadius.circular(2),
      ),
    ),
  );
}
