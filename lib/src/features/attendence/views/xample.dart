// SizedBox(
//         width: Get.width,
//         child: Obx(
//           () => presensiC.isLoadingLokasi.value
//               ? const Center(
//                   child: Column(
//                     children: [
//                       Text("Check Lokasi ...."),
//                       CircularProgressIndicator(),
//                     ],
//                   ),
//                 )
//               : isLoading
//                   ? const Center(
//                       child: CircularProgressIndicator(),
//                     )
//                   : _permissionGranted == PermissionStatus.deniedForever
//                       ? warningNotLocation()
//                       : Column(
//                           children: [
//                             Container(
//                               width: Get.width,
//                               height: Get.height * 0.65,
//                               color: cGrey_400,
//                               child: Column(
//                                 children: [
//                                   Flexible(
//                                     child: FlutterMap(
//                                       options: MapOptions(
//                                         initialCenter: latLng,
//                                         initialZoom: _calculateZoomLevel(
//                                           _calculateDistanceInMeters(
//                                               LatLng(
//                                                 double.parse(
//                                                     presensiC.latitude.value),
//                                                 double.parse(
//                                                     presensiC.longitude.value),
//                                               ),
//                                               latLng),
//                                         ).toDouble(),
//                                       ),
//                                       children: [
//                                         TileLayer(
//                                           urlTemplate:
//                                               'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//                                           userAgentPackageName:
//                                               'com.example.app',
//                                         ),
//                                         CircleLayer(
//                                           circles: [
//                                             CircleMarker(
//                                               borderColor: cRed,
//                                               borderStrokeWidth: 5,
//                                               color: const Color(0x99FF8484),
//                                               point: LatLng(
//                                                 double.parse(
//                                                     presensiC.latitude.value),
//                                                 double.parse(
//                                                     presensiC.longitude.value),
//                                               ),
//                                               radius: double.parse(
//                                                   presensiC.radius.value),
//                                               useRadiusInMeter: true,
//                                             ),
//                                           ],
//                                         ),
//                                         MarkerLayer(
//                                           markers: [
//                                             Marker(
//                                               point: latLng,
//                                               width: 80,
//                                               height: 80,
//                                               child: const Column(
//                                                 children: [
//                                                   Text(
//                                                     "Your Location",
//                                                     style: TextStyle(
//                                                         fontWeight:
//                                                             FontWeight.w500,
//                                                         fontSize: 9,
//                                                         color: cBlack),
//                                                   ),
//                                                   Icon(
//                                                     Icons.location_on_outlined,
//                                                     color: cRed,
//                                                     size: 30,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         PolylineLayer(
//                                           polylines: [
//                                             Polyline(
//                                               points: [
//                                                 latLng,
//                                                 _getClosestPointOnCircle(
//                                                   LatLng(
//                                                     double.parse(presensiC
//                                                         .latitude.value),
//                                                     double.parse(presensiC
//                                                         .longitude.value),
//                                                   ),
//                                                   latLng,
//                                                   double.parse(
//                                                       presensiC.radius.value),
//                                                 )
//                                               ],
//                                               strokeWidth: 4,
//                                               color: cPrimary,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 width: Get.width,
//                                 color: cWhite,
//                                 child: Column(
//                                   children: [
//                                     (const Distance().distance(
//                                               latLng,
//                                               LatLng(
//                                                 double.parse(
//                                                     presensiC.latitude.value),
//                                                 double.parse(
//                                                     presensiC.longitude.value),
//                                               ),
//                                             ) <=
//                                             double.parse(
//                                                 presensiC.radius.value))
//                                         ? Container(
//                                             color: cPrimary,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(6),
//                                               child: Row(
//                                                 children: [
//                                                   const Icon(
//                                                     Icons.warning_amber,
//                                                     size: 20,
//                                                     color: cBlack,
//                                                   ),
//                                                   spaceWidth(5),
//                                                   Text(
//                                                     "Anda di area kantor",
//                                                     style: customTextStyle(
//                                                       FontWeight.w500,
//                                                       12,
//                                                       cBlack,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                         : Container(
//                                             color: cRed_100,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(6),
//                                               child: Row(
//                                                 children: [
//                                                   const Icon(
//                                                     Icons.warning_amber,
//                                                     size: 20,
//                                                     color: cRed,
//                                                   ),
//                                                   spaceWidth(5),
//                                                   Text(
//                                                     "Anda diluar area kantor",
//                                                     style: customTextStyle(
//                                                         FontWeight.w500,
//                                                         12,
//                                                         cRed),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                     spaceHeight(20),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20),
//                                       child: presensiC
//                                               .isLoadingCheckJadwalMasuk.value
//                                           ? const CircularProgressIndicator()
//                                           : SizedBox(
//                                               width: Get.width,
//                                               height: 45,
//                                               child: ElevatedButton.icon(
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: cPrimary,
//                                                   shadowColor: cGrey_400,
//                                                   elevation: 2,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                       8,
//                                                     ), // Mengatur border radius menjadi 0
//                                                   ),
//                                                 ),
//                                                 onPressed: (presensiC.isJadwal
//                                                                 .value ==
//                                                             true &&
//                                                         presensiC
//                                                                 .isPresensiMasuk
//                                                                 .value ==
//                                                             false)
//                                                     ? () {
//                                                         if (const Distance()
//                                                                 .distance(
//                                                                     latLng,
//                                                                     LatLng(
//                                                                       double.parse(presensiC
//                                                                           .latitude
//                                                                           .value),
//                                                                       double.parse(presensiC
//                                                                           .longitude
//                                                                           .value),
//                                                                     )) <=
//                                                             int.parse(presensiC
//                                                                 .radius
//                                                                 .value)) {
//                                                           if (presensiC
//                                                               .isLoadingPresensiMasuk
//                                                               .value) {
//                                                           } else {
//                                                             presensiC.presensiMasuk(
//                                                                 presensiC
//                                                                     .idLokasi
//                                                                     .value,
//                                                                 latLng.latitude
//                                                                     .toString(),
//                                                                 latLng.longitude
//                                                                     .toString(),
//                                                                 ipAddressC
//                                                                     .ipAdressv
//                                                                     .value);
//                                                           }
//                                                         } else {
//                                                           snackbarfailed(
//                                                               "Anda Diluar area kantor");
//                                                         }
//                                                       }
//                                                     : null,
//                                                 label: Text(
//                                                   presensiC
//                                                           .isLoadingPresensiMasuk
//                                                           .value
//                                                       ? "Loading..."
//                                                       : "Presensi Masuk",
//                                                   style: const TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: cWhite,
//                                                   ),
//                                                 ),
//                                                 icon: const Icon(
//                                                   CommunityMaterialIcons
//                                                       .location_enter,
//                                                   size: 25,
//                                                   color: cWhite,
//                                                 ),
//                                               ),
//                                             ),
//                                     ),
//                                     spaceHeight(10),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 20),
//                                       child: SizedBox(
//                                         width: Get.width,
//                                         height: 45,
//                                         child: presensiC
//                                                 .isLoadingCheckAbsenMasuk.value
//                                             ? Container()
//                                             : ElevatedButton.icon(
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: cPrimary,
//                                                   shadowColor: cGrey_400,
//                                                   elevation: 2,
//                                                   shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                       8,
//                                                     ), // Mengatur border radius menjadi 0
//                                                   ),
//                                                 ),
//                                                 onPressed: (presensiC.isJadwal
//                                                                 .value ==
//                                                             true &&
//                                                         presensiC
//                                                                 .isPresensiMasuk
//                                                                 .value ==
//                                                             true &&
//                                                         presensiC
//                                                                 .isPresensiPulang
//                                                                 .value ==
//                                                             false)
//                                                     ? () {
//                                                         if (const Distance()
//                                                                 .distance(
//                                                                     latLng,
//                                                                     LatLng(
//                                                                       double.parse(presensiC
//                                                                           .latitude
//                                                                           .value),
//                                                                       double.parse(presensiC
//                                                                           .longitude
//                                                                           .value),
//                                                                     )) <=
//                                                             int.parse(presensiC
//                                                                 .radius
//                                                                 .value)) {
//                                                           if (presensiC
//                                                               .isLoadingPresensiPulang
//                                                               .value) {
//                                                           } else {
//                                                             presensiC.presensiPulang(
//                                                                 presensiC
//                                                                     .idLokasi
//                                                                     .value,
//                                                                 latLng.latitude
//                                                                     .toString(),
//                                                                 latLng.longitude
//                                                                     .toString(),
//                                                                 ipAddressC
//                                                                     .ipAdressv
//                                                                     .value);
//                                                           }
//                                                         } else {
//                                                           snackbarfailed(
//                                                               "Anda Diluar area kantor");
//                                                         }
//                                                       }
//                                                     : null,
//                                                 label: Text(
//                                                   presensiC
//                                                           .isLoadingPresensiPulang
//                                                           .value
//                                                       ? "Loading"
//                                                       : "Presensi Pulang",
//                                                   style: const TextStyle(
//                                                     fontSize: 16,
//                                                     fontWeight: FontWeight.w600,
//                                                     color: cWhite,
//                                                   ),
//                                                 ),
//                                                 icon: const Icon(
//                                                   CommunityMaterialIcons
//                                                       .location_exit,
//                                                   size: 25,
//                                                   color: cWhite,
//                                                 ),
//                                               ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//         ),
//       ),