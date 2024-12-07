import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_and_geolocator/location_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController controller = Get.put(LocationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Real-Time Location Tracker'),
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
            onMapCreated: (GoogleMapController googleMapController) {
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    zoom: 17,
                    target: controller.latLngPosition.value,
                  ),
                ),
              );
            },
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('my_location_id'),
                infoWindow: InfoWindow(title: 'My current location', snippet: '${controller.latLngPosition.value}'),
                visible: true,
                position: controller.latLngPosition.value,
              )
            },
            // trafficEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            polylines: <Polyline>{
              Polyline(
                polylineId: const PolylineId('random_polyline_id'),
                color: Colors.blue,
                jointType: JointType.round,
                visible: true,
                points: controller.latLngPositionList,
              ),
            },
          );
        },
      ),
    );
  }
}
