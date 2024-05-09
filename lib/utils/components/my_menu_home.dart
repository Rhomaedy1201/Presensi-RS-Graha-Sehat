import 'package:flutter/material.dart';
import 'package:presensi_gs/routes/route_name.dart';

class MenuHome {
  List menu = [
    {
      'title': 'Profil',
      'icon': Icons.person_2_outlined,
      'bg_color': const Color(0xFFF7DAEB),
      'icon_color': const Color(0xFFFB3BAB),
      'route': null,
    },
    {
      'title': 'Presensi',
      'icon': Icons.location_on_outlined,
      'bg_color': const Color(0xFFCEFBD9),
      'icon_color': const Color(0xFF34CCD5),
      'route': null,
    },
    {
      'title': 'Perizinan',
      'icon': Icons.airplanemode_on_sharp,
      'bg_color': const Color(0xFFF7F1DA),
      'icon_color': const Color(0xFFFCDE46),
      'route': null,
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
      'route': null,
    },
    {
      'title': 'Informasi',
      'icon': Icons.info_outline,
      'bg_color': const Color(0xFFF7DAEB),
      'icon_color': const Color(0xFFFB3BAB),
      'route': null,
    },
  ];
}
