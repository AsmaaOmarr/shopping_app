import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shopping_app/features/home/models/store.dart';

class DistanceProvider extends ChangeNotifier {
  String? distance;

  Future<void> getDistance(StoreModel store) async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    print(locationServiceEnabled);

    LocationPermission locationPermission = await Geolocator.checkPermission();
    print(locationPermission);
    if (locationPermission != LocationPermission.whileInUse &&
        locationPermission != LocationPermission.always) {
      locationPermission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position.latitude);
      print(position.longitude);
      double distanceInMeters = await Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          store.latitude,
          store.longitude);
      double distanceInKm = distanceInMeters / 1000;
      distance = "${distanceInKm.toStringAsFixed(2)} km";
      notifyListeners();
    } catch (e) {
      print("Error: $e");
      distance = "Error getting distance";
      notifyListeners();
    }
  }
}
