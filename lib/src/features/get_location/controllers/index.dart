import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class GetLocationController extends GetxController {
  Location location = Location();
  bool? _servicesEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  var isLoading = false.obs;

  Future<dynamic> getLocation() async {
    try {
      isLoading(true);
      _servicesEnabled = await location.serviceEnabled();
      if (!_servicesEnabled!) {
        _servicesEnabled = await location.requestService();
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
      }

      _locationData = await location.getLocation();

      return _locationData;
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
