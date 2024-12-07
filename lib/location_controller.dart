import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  final latLngPositionList = <LatLng>[].obs;
  final latLngPosition = const LatLng(0, 0).obs;
  final isLoading = false.obs;
  late StreamSubscription<Position> positionStream;

  @override
  void onInit() {
    listenCurrentLocation();
    super.onInit();
  }

  Future<void> getCurrentLocation() async {
    isLoading(true);
    try {
      final isGranted = await isLocationPermissionGranted();
      if (isGranted) {
        final serviceStatus = await checkGPSServiceEnable();
        if (serviceStatus) {
          final Position position = await Geolocator.getCurrentPosition();
          updatePositionList(position);
          isLoading(false);
        } else {
          Geolocator.openLocationSettings();
        }
      } else {
        final isPermission = await requestLocationPermission();
        if (isPermission) {
          getCurrentLocation();
        } else {
          Geolocator.openAppSettings();
        }
      }
    } catch (e) {
      debugPrint('Error fetching current location: $e');
    }
  }

  Future<void> listenCurrentLocation() async {
    isLoading(true);
    try {
      final isGranted = await isLocationPermissionGranted();
      if (isGranted) {
        final serviceStatus = await checkGPSServiceEnable();
        if (serviceStatus) {
          positionStream = Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              timeLimit: Duration(seconds: 10),
              accuracy: LocationAccuracy.best
            ),
          ).listen(
            (position) {
              updatePositionList(position);
              isLoading(false);
            },
            onError: (error) => debugPrint('Stream error: $error'),
          );
        } else {
          await Geolocator.openLocationSettings();
        }
      } else {
        final isPermission = await requestLocationPermission();
        if (isPermission) {
          await getCurrentLocation();
        } else {
          await Geolocator.openAppSettings();
        }
      }
    } catch (e) {
      debugPrint('Error in listenCurrentLocation: $e');
    }
  }

  Future<bool> isLocationPermissionGranted() async {
    final permission = await Geolocator.checkPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  Future<bool> requestLocationPermission() async {
    final permission = await Geolocator.requestPermission();
    return permission == LocationPermission.always || permission == LocationPermission.whileInUse;
  }

  Future<bool> checkGPSServiceEnable() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  void updatePositionList(Position position) {
    debugPrint(position.toString());
    final newLatLng = LatLng(position.latitude, position.longitude);
    if (latLngPositionList.isEmpty || latLngPositionList.last != newLatLng) {
      latLngPositionList.add(newLatLng);
      latLngPosition.value = newLatLng;
    }
  }

  @override
  void onClose() {
    positionStream.cancel();
    super.onClose();
  }
}
