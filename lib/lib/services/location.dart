import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class location {
  late double latt;
  late double longg;

  Future<void> getcurrentLoc() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latt = position.latitude;
      longg = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
