import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:presensi_gs/src/features/attendence/controllers/presensi_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';

class PresensiView extends StatefulWidget {
  const PresensiView({super.key});

  @override
  State<PresensiView> createState() => _PresensiViewState();
}

class _PresensiViewState extends State<PresensiView> {
  LatLng latLng = LatLng(0, 0);
  Location location = Location();
  var servicesEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  var isLoading = false;
  PermissionStatus? _permissionStatus;

  // Controller
  PresensiController presensiC = Get.put(PresensiController());

  @override
  void initState() {
    super.initState();
    fetchLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      fetchChangedLocation();
    });
  }

  fetchChangedLocation() {
    getChangedLocation().then((value) {
      if (value != null) {
        setState(() {
          latLng = LatLng(value.latitude!, value.longitude!);
        });
      }
    });
  }

  fetchLocation() {
    getLocation().then((value) {
      if (value != null) {
        setState(() {
          latLng = LatLng(value.latitude!, value.longitude!);
        });
      }
    });
  }

  Future<LocationData?> getLocation() async {
    try {
      isLoading = true;
      setState(() {});

      // Memeriksa dan mengaktifkan layanan lokasi
      servicesEnabled = await location.serviceEnabled();
      if (!servicesEnabled) {
        servicesEnabled = await location.requestService();
        if (!servicesEnabled) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                  'Layanan lokasi dinonaktifkan, silahkan aktifkan ulang supaya anda bisa presensi.'),
              backgroundColor: Colors.red,
            ),
          );
          return null;
        }
      }

      // Memeriksa dan meminta izin lokasi
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text(
                  'Izin lokasi ditolak, silahkan aktifkan lokasinya supaya anda bisa presensi.'),
              backgroundColor: Colors.red,
            ),
          );
          return null;
        }
      }

      if (_permissionGranted == PermissionStatus.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            content: Text(
                'Izin lokasi ditolak secara permanen, silahkan aktifkan lokasinya supaya anda bisa presensi.'),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }

      _locationData = await location.getLocation();
      return _locationData;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    } finally {
      isLoading = false;
      setState(() {});
    }
  }

  Future<LocationData?> getChangedLocation() async {
    try {
      _locationData = await location.getLocation();
      return _locationData;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
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
              () => presensiC.isLoadingLokasi.value
                  ? const Center(
                      child: Column(
                        children: [
                          Text("Check Lokasi ...."),
                          CircularProgressIndicator(),
                        ],
                      ),
                    )
                  : isLoading
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
                                      options: MapOptions(
                                        initialCenter: LatLng(
                                          double.parse(
                                              presensiC.latitude.value),
                                          double.parse(
                                              presensiC.longitude.value),
                                        ),
                                        initialZoom: 18,
                                      ),
                                      children: [
                                        TileLayer(
                                          urlTemplate:
                                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                          userAgentPackageName:
                                              'com.example.app',
                                        ),
                                        CircleLayer(
                                          circles: [
                                            CircleMarker(
                                              borderColor: cRed,
                                              borderStrokeWidth: 5,
                                              color: const Color(0x99FF8484),
                                              point: LatLng(
                                                double.parse(
                                                    presensiC.latitude.value),
                                                double.parse(
                                                    presensiC.longitude.value),
                                              ),
                                              radius: 40,
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
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                              LatLng(
                                                double.parse(
                                                    presensiC.latitude.value),
                                                double.parse(
                                                    presensiC.longitude.value),
                                              ),
                                            ) <=
                                            40)
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
                                                        FontWeight.w500,
                                                        12,
                                                        cRed),
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
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: cPrimary,
                                            shadowColor: cGrey_400,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ), // Mengatur border radius menjadi 0
                                            ),
                                          ),
                                          onPressed: () {
                                            print(const Distance().distance(
                                                    latLng,
                                                    const LatLng(-7.943586,
                                                        113.796086)) <=
                                                50);
                                            print(latLng);
                                            print(_permissionStatus ==
                                                PermissionStatus.granted);
                                          },
                                          label: const Text(
                                            "Presensi Masuk",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: cWhite,
                                            ),
                                          ),
                                          icon: const Icon(
                                            CommunityMaterialIcons
                                                .location_enter,
                                            size: 25,
                                            color: cWhite,
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
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: cPrimary,
                                            shadowColor: cGrey_400,
                                            elevation: 2,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ), // Mengatur border radius menjadi 0
                                            ),
                                          ),
                                          onPressed: null,
                                          label: const Text(
                                            "Presensi Pulang",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: cWhite,
                                            ),
                                          ),
                                          icon: const Icon(
                                            CommunityMaterialIcons
                                                .location_exit,
                                            size: 25,
                                            color: cWhite,
                                          ),
                                        ),
                                      ),
                                    ),
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
