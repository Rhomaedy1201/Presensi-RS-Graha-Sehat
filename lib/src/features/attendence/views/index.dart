import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';

class PresensiView extends StatelessWidget {
  const PresensiView({super.key});

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      backgroundColor: cPrimary,
      centerTitle: true,
      title: Text(
        'Presensi',
        style: customTextStyle(FontWeight.w500, 20, cBlack),
      ),
    );
    return Scaffold(
      backgroundColor: cGrey_100,
      appBar: appbar,
      body: Column(
        children: [
          Container(
            width: Get.width,
            height: Get.height * 0.75,
            color: cGrey_400,
            child: Column(
              children: [
                Flexible(
                  child: FlutterMap(
                    options: const MapOptions(
                      initialCenter: LatLng(-7.943586, 113.796086),
                      initialZoom: 18,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      const CircleLayer(
                        circles: [
                          CircleMarker(
                            borderColor: cRed,
                            borderStrokeWidth: 5,
                            color: Color.fromARGB(153, 109, 109, 109),
                            point: LatLng(-7.943586, 113.796086),
                            radius: 50,
                            useRadiusInMeter: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
