import 'dart:async';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:presensi_gs/http/component_controller/ip_address_controller.dart';
import 'package:presensi_gs/src/features/attendence/controllers/presensi_controller.dart';
import 'package:presensi_gs/src/features/pengajuan_lembur/controllers/presensi_lembur_controller.dart';
import 'package:presensi_gs/utils/colors.dart';
import 'package:presensi_gs/utils/components/my_shimmer.dart';
import 'package:presensi_gs/utils/components/my_snacbar.dart';
import 'package:presensi_gs/utils/components/my_style_text.dart';
import 'package:presensi_gs/utils/components/space.dart';
import 'package:presensi_gs/utils/constant.dart';
import 'package:safe_device/safe_device.dart';

class PresensiLocationLember extends StatefulWidget {
  const PresensiLocationLember({super.key});

  @override
  State<PresensiLocationLember> createState() => _PresensiLocationLemberState();
}

class _PresensiLocationLemberState extends State<PresensiLocationLember> {
  // Controller
  PresensiController presensiC = Get.put(PresensiController());
  PresensiLemburController presensiLemburC = Get.put(PresensiLemburController());
  IpAddressController ipAddressC = Get.put(IpAddressController());

  bool isLoadingMock = false;

  Future<void> checkMockLocation() async {
    try {
      isLoadingMock = true;
      bool isMock = await SafeDevice.isMockLocation;
      setState(() {
        presensiC.checkMockLocation.value = isMock;
      });
      print("ISMOCK : $isMock");
    } catch (e) {
      print("MOCK : ${e.toString()}");
    } finally {
      isLoadingMock = false;
    }
  }

  // Loacation
  LatLng latLng = LatLng(0, 0);
  Location location = Location();
  var servicesEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  var isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchLocation();
    location.onLocationChanged.listen((LocationData currentLocation) {
      fetchChangedLocation();
      checkMockLocation();
    });
    checkMockLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  fetchChangedLocation() {
    getChangedLocation().then((value) {
      if (value != null) {
        if (mounted) {
          setState(() {
            latLng = LatLng(value.latitude!, value.longitude!);
          });
        }
      }
    });
  }

  fetchLocation() {
    getLocation().then((value) {
      if (value != null) {
        if (mounted) {
          setState(() {
            latLng = LatLng(value.latitude!, value.longitude!);
          });
        }
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

  LatLng _getClosestPointOnCircle(LatLng center, LatLng point, double radius) {
    final Distance distance = Distance();
    final double distanceToPoint = distance.as(LengthUnit.Meter, center, point);

    if (distanceToPoint <= radius) {
      return point;
    }

    final double ratio = radius / distanceToPoint;
    final double lat =
        center.latitude + (point.latitude - center.latitude) * ratio;
    final double lng =
        center.longitude + (point.longitude - center.longitude) * ratio;

    return LatLng(lat, lng);
  }

  double _calculateZoomLevel(double distanceInMeters) {
    // Konversi jarak maksimum yang ingin ditampilkan (dalam meter) menjadi tingkat zoom
    // Contoh: jarak maksimum 1000 meter di zoom level tertentu bisa diatur secara linear atau logaritmik
    if (distanceInMeters < 100) {
      return 18;
    } else if (distanceInMeters < 500) {
      return 16;
    } else if (distanceInMeters < 1000) {
      return 15;
    } else if (distanceInMeters < 2000) {
      return 14;
    } else if (distanceInMeters < 5000) {
      return 13;
    } else {
      return 12;
    }
  }

  double _calculateDistanceInMeters(LatLng center, LatLng point) {
    final Distance distance = Distance();
    return distance.as(LengthUnit.Meter, center, point);
  }

  @override
  Widget build(BuildContext context) {
    var heightStatusBar = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: cGrey_100,
      // appBar: appbar,
      body: Obx(
        () => presensiC.isLoadingLokasi.value
            ? const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Check Lokasi ...."),
                    CircularProgressIndicator(),
                  ],
                ),
              )
            : isLoading
                ? const Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Check Lokasi ...."),
                        CircularProgressIndicator(),
                      ],
                    ),
                  )
                : _permissionGranted == PermissionStatus.deniedForever
                    ? warningNotLocation()
                    : AnimatedSize(
                        duration: const Duration(milliseconds: 900),
                        curve: Curves.linear,
                        child: Stack(
                          children: [
                            Container(
                              color: cGrey_500,
                              child: FlutterMap(
                                options: MapOptions(
                                  initialCenter: latLng,
                                  initialZoom: _calculateZoomLevel(
                                    _calculateDistanceInMeters(
                                        LatLng(
                                          double.parse(
                                              presensiC.latitude.value),
                                          double.parse(
                                              presensiC.longitude.value),
                                        ),
                                        latLng),
                                  ).toDouble(),
                                ),
                                children: [
                                  TileLayer(
                                    urlTemplate:
                                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                    userAgentPackageName: 'com.example.app',
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
                                        radius: double.parse(
                                            presensiC.radius.value),
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
                                  PolylineLayer(
                                    polylines: [
                                      Polyline(
                                        points: [
                                          latLng,
                                          _getClosestPointOnCircle(
                                            LatLng(
                                              double.parse(
                                                  presensiC.latitude.value),
                                              double.parse(
                                                  presensiC.longitude.value),
                                            ),
                                            latLng,
                                            double.parse(
                                                presensiC.radius.value),
                                          )
                                        ],
                                        strokeWidth: 4,
                                        color: cPrimary,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              width: Get.width,
                              height: 100,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: heightStatusBar + 5,
                                    left: 20,
                                    right: 20),
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 350),
                                  curve: Curves.linear,
                                  child: SizedBox(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: cWhite,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: cGrey_700,
                                                  blurRadius: 20,
                                                  offset: Offset(
                                                      1, 1), // Shadow position
                                                ),
                                              ],
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(9),
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: cBlack,
                                                size: 27,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Presensi Lembur",
                                          style: customTextStyle(
                                            FontWeight.w900,
                                            20,
                                            cBlack,
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            // presensiC.getLokasi();
                                            // presensiC.checkJadwalMasuk();
                                            // presensiC.checkAbsenMasuk();
                                            // presensiC.checkAbsenPulang();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: cWhite,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: cGrey_700,
                                                  blurRadius: 20,
                                                  offset: Offset(
                                                      1, 1), // Shadow position
                                                ),
                                              ],
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(9),
                                              child: Icon(
                                                Icons.refresh,
                                                size: 27,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              width: Get.width,
                              bottom: 1,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: Column(
                                  children: [
                                    presensiC.checkMockLocation.value
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.orangeAccent,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: cGrey_700,
                                                  blurRadius: 10,
                                                  offset: Offset(
                                                      1, 1), // Shadow position
                                                ),
                                              ],
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(6),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_off_outlined,
                                                    size: 20,
                                                    color: Color(0xFF915700),
                                                  ),
                                                  spaceWidth(5),
                                                  Text(
                                                    "Anda terdeteksi lokasi palsu, silahkan \nmatikan lokasi palsu anda!.",
                                                    style: customTextStyle(
                                                      FontWeight.w500,
                                                      12,
                                                      const Color(0xFF915700),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    spaceHeight(7),
                                    (const Distance().distance(
                                              latLng,
                                              LatLng(
                                                double.parse(
                                                    presensiC.latitude.value),
                                                double.parse(
                                                    presensiC.longitude.value),
                                              ),
                                            ) <=
                                            double.parse(
                                                presensiC.radius.value))
                                        ? Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: cPrimary,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: cGrey_500,
                                                  blurRadius: 10,
                                                  offset: Offset(
                                                      1, 1), // Shadow position
                                                ),
                                              ],
                                            ),
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
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: cRed_100,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: cGrey_700,
                                                  blurRadius: 10,
                                                  offset: Offset(
                                                      1, 1), // Shadow position
                                                ),
                                              ],
                                            ),
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
                                    spaceHeight(7),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: cWhite,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: cGrey_700,
                                            blurRadius: 20,
                                            offset:
                                                Offset(1, 1), // Shadow position
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 20),
                                        child: Column(
                                          children: [
                                            presensiLemburC.isLoadingTime.value ? Column(
                                                    children: [
                                                      myShimmer(140, 40),
                                                      spaceHeight(3),
                                                      myShimmer(180, 20),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      presensiLemburC.ntpTime != null ?
                                                      Text(
                                                        presensiLemburC.ntpTime!.value.getTimeSecond(),
                                                        style: customTextStyle(FontWeight.w900,21,cBlack),
                                                      ) : 
                                                      Text(
                                                        presensiLemburC.ntpTime!.value.getTimeSecond(),
                                                        style: customTextStyle(FontWeight.w900,21,cBlack)),
                                                      Text(
                                                        presensiLemburC.ntpTime!.value.getSimpleDayAndDate(),
                                                        style: customTextStyle(FontWeight.w800,13,cBlack),
                                                      ),
                                                    ],
                                                  ),
                                            spaceHeight(15),
                                            Container(
                                              width: Get.width,
                                              height: 2,
                                              color: cGrey_300,
                                            ),
                                            spaceHeight(15),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: presensiC.isLoadingCheckJadwalMasuk.value
                                                ? const CircularProgressIndicator()
                                                : SizedBox(
                                                    width: Get.width,
                                                    height: 40,
                                                    child: ElevatedButton.icon(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: cPrimary,
                                                        shadowColor: cGrey_400,
                                                        elevation: 2,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5), // Mengatur border radius menjadi 0
                                                        ),
                                                      ),
                                                      onPressed: (Get.arguments['lembur'] != null && Get.arguments['lembur']['masuk'] == null) ? () {
                                                        if (presensiC.checkMockLocation.value) {
                                                          snackbarfailed("Anda terdeteksi lokasi palsu, silahkan matikan lokasi palsu anda!.");
                                                        } else {
                                                          if (const Distance().distance(latLng,LatLng(double.parse(presensiC.latitude.value), 
                                                            double.parse(presensiC.longitude.value))) <=int.parse(presensiC.radius.value)) {
                                                            if (presensiLemburC.isLoadingPresensiMasuk.value) {
                                                            } else {
                                                              presensiLemburC.presensiLemburLokasi(Get.arguments['lembur']['id'], "MASUK", latLng.latitude, latLng.longitude);
                                                            }
                                                          } else {
                                                            snackbarfailed("Anda Diluar area kantor");
                                                          }
                                                        }
                                                      }
                                                      : null,
                                                      label: Text(
                                                        presensiLemburC.isLoadingPresensiMasuk.value ? "Loading..." : "Presensi Masuk",
                                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: cWhite,),
                                                      ),
                                                      icon: const Icon(CommunityMaterialIcons.location_enter, size: 25, color: cWhite,),
                                                    ),
                                                  ),
                                            ),
                                            spaceHeight(5),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 20),
                                              child: presensiC.isLoadingCheckJadwalMasuk.value
                                                ? const CircularProgressIndicator()
                                                : SizedBox(
                                                    width: Get.width,
                                                    height: 40,
                                                    child: ElevatedButton.icon(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: cPrimary,
                                                        shadowColor: cGrey_400,
                                                        elevation: 2,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5), // Mengatur border radius menjadi 0
                                                        ),
                                                      ),
                                                      onPressed: (Get.arguments['lembur'] != null && Get.arguments['lembur']['masuk'] != null) ? () {
                                                        if (presensiC.checkMockLocation.value) {
                                                          snackbarfailed("Anda terdeteksi lokasi palsu, silahkan matikan lokasi palsu anda!.");
                                                        } else {
                                                          if (const Distance().distance(latLng,LatLng(double.parse(presensiC.latitude.value), 
                                                            double.parse(presensiC.longitude.value))) <=int.parse(presensiC.radius.value)) {
                                                            if (presensiLemburC.isLoadingPresensiMasuk.value) {
                                                            } else {
                                                              presensiLemburC.presensiLemburLokasi(Get.arguments['lembur']['id'], "KELUAR", latLng.latitude, latLng.longitude);
                                                            }
                                                          } else {
                                                            snackbarfailed("Anda Diluar area kantor");
                                                          }
                                                        }
                                                      }
                                                      : null,
                                                      label: Text(
                                                        presensiLemburC.isLoadingPresensiKeluar.value ? "Loading..." : "Presensi Pulang",
                                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: cWhite,),
                                                      ),
                                                      icon: const Icon(CommunityMaterialIcons.location_enter, size: 25, color: cWhite,),
                                                    ),
                                                  ),
                                            ),
                                            spaceHeight(10),
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
                      ),
      ),
    );
  }

  Column warningNotLocation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning_amber,
          size: 60,
          color: cYellow,
        ),
        spaceHeight(20),
        Text(
          "Lokasi tidak di izinkan.",
          style: customTextStyle(FontWeight.w500, 15, cBlack),
        ),
        Text(
          "Silahkan aktifkan Lokasi Aplikasi ini",
          style: customTextStyle(FontWeight.w500, 15, cBlack),
        ),
        Text(
          "supaya anda bisa presensi.",
          style: customTextStyle(FontWeight.w500, 15, cBlack),
        ),
      ],
    );
  }
}
