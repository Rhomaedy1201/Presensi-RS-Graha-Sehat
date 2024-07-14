import 'package:flutter/material.dart';
import 'package:presensi_gs/routes/route_name.dart';

class MenuHome {
  List menu = [
    {
      'title': 'Profil',
      'icon': Icons.person_2_outlined,
      'bg_color': const Color(0xFFF7DAEB),
      'icon_color': const Color(0xFFFB3BAB),
      'route': RouteNames.profileView,
    },
    {
      'title': 'Presensi',
      'icon': Icons.location_on_outlined,
      'bg_color': const Color(0xFFCEFBD9),
      'icon_color': const Color(0xFF34CCD5),
      'route': RouteNames.presensi,
    },
    {
      'title': 'Perizinan',
      'icon': Icons.airplanemode_on_sharp,
      'bg_color': const Color(0xFFF7F1DA),
      'icon_color': const Color(0xFFFCDE46),
      'route': null,
      // 'route': RouteNames.perizinanView,
    },
    {
      'title': 'Lembur',
      'icon': Icons.timer_outlined,
      'bg_color': const Color(0xFFDBDAF7),
      'icon_color': const Color(0xFF6E7CF3),
      'route': null,
    },
    {
      'title': 'Histori',
      'icon': Icons.edit_calendar_outlined,
      'bg_color': const Color(0xFFCEFBD9),
      'icon_color': const Color(0xFF34CCD5),
      'route': RouteNames.historiPresensi,
    },
    {
      'title': 'Jadwal',
      'icon': Icons.calendar_month_outlined,
      'bg_color': const Color(0xFFF7F1DA),
      'icon_color': const Color(0xFFFCDE46),
      'route': RouteNames.jadwal,
    },
    {
      'title': 'Tukar Shift',
      'icon': Icons.change_circle_outlined,
      'bg_color': const Color(0xFFDBDAF7),
      'icon_color': const Color(0xFF6E7CF3),
      // 'route': null,
      'route': RouteNames.tukarShift,
    },
    {
      'title': 'Approval',
      'icon': Icons.edit_document,
      'bg_color': const Color(0xFFF7DAEB),
      'icon_color': const Color(0xFFFB3BAB),
      'route': null,
      // 'route': RouteNames.approvalView,
    },
  ];
}
