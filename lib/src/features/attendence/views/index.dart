import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:presensi_gs/src/features/get_location/controllers/index.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class PresensiView extends StatefulWidget {
  const PresensiView({super.key});

  @override
  State<PresensiView> createState() => _PresensiViewState();
}

class _PresensiViewState extends State<PresensiView> {
  LatLng latLng = const LatLng(0, 0);
  GetLocationController getLocationC = Get.put(GetLocationController());

  @override
  void initState() {
    super.initState();
    getLocationC.getLocation().then((value) {
      latLng = LatLng(value.latitude, value.longitude);
    });
  }

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
      body: Stack(
        children: [
          SizedBox(
            width: Get.width,
            child: Obx(
              () => getLocationC.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: [
                        Container(
                          width: Get.width,
                          height: Get.height * 0.65,
                          color: cGrey_400,
                          child: Column(
                            children: [
                              Flexible(
                                child: FlutterMap(
                                  options: const MapOptions(
                                    initialCenter:
                                        LatLng(-7.943586, 113.796086),
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
                                          color: Color(0x99FF8484),
                                          point: LatLng(-7.943586, 113.796086),
                                          radius: 50,
                                          useRadiusInMeter: true,
                                        ),
                                      ],
                                    ),
                                    MarkerLayer(
                                      markers: [
                                        Marker(
                                          point: latLng,
                                          width: 80,
                                          height: 80,
                                          child: const Column(
                                            children: [
                                              Text(
                                                "Your Location",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 9,
                                                    color: cBlack),
                                              ),
                                              Icon(
                                                Icons.location_on_outlined,
                                                color: cRed,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: Get.width,
                            color: cWhite,
                            child: Column(
                              children: [
                                (const Distance().distance(
                                            latLng,
                                            const LatLng(
                                                -7.943586, 113.796086)) <=
                                        50)
                                    ? Container(
                                        color: cPrimary,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.warning_amber,
                                                size: 20,
                                                color: cBlack,
                                              ),
                                              spaceWidth(5),
                                              Text(
                                                "Anda di area kantor",
                                                style: customTextStyle(
                                                  FontWeight.w500,
                                                  12,
                                                  cBlack,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Container(
                                        color: cRed_100,
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.warning_amber,
                                                size: 20,
                                                color: cRed,
                                              ),
                                              spaceWidth(5),
                                              Text(
                                                "Anda diluar area kantor",
                                                style: customTextStyle(
                                                    FontWeight.w500, 12, cRed),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                spaceHeight(20),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SizedBox(
                                    width: Get.width,
                                    height: 45,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cPrimary,
                                        shadowColor: cPrimary_400,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ), // Mengatur border radius menjadi 0
                                        ),
                                      ),
                                      onPressed: () {
                                        getLocationC
                                            .getLocation()
                                            .then((value) {
                                          print(value.latitude);
                                        });

                                        print(Distance().distance(
                                                latLng,
                                                const LatLng(
                                                    -7.943586, 113.796086)) <=
                                            50);
                                      },
                                      child: const Text(
                                        "Presensi Masuk",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: cWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                spaceHeight(10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: SizedBox(
                                    width: Get.width,
                                    height: 45,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: cPrimary,
                                        shadowColor: cPrimary_400,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ), // Mengatur border radius menjadi 0
                                        ),
                                      ),
                                      onPressed: null,
                                      child: const Text(
                                        "Presensi Pulang",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: cWhite,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
