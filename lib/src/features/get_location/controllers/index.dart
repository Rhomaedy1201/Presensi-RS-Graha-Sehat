import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class GetLocationController extends GetxController {
  Location location = Location();
  var servicesEnabled = false.obs;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  var isLoading = false.obs;

  Future<dynamic> getLocation() async {
    try {
      isLoading(true);
      servicesEnabled.value = await location.serviceEnabled();
      if (!servicesEnabled.value) {
        servicesEnabled.value = await location.requestService();
        if (!servicesEnabled.value) {
          return;
        }
      }

      // _permissionGranted = await location.hasPermission();
      // if (_permissionGranted == PermissionStatus.denied) {
      //   _permissionGranted = await location.requestPermission();
      // }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();
      return _locationData;
    } catch (e) {
      debugPrint(e.toString());
      print("Catch");
    } finally {
      isLoading(false);
      print("FINALL ");
    }
  }
}
