// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_and_geolocator/location_controller.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GeoLocatorScreen extends StatelessWidget {
//   const GeoLocatorScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GeoLocatorController controller = Get.put(GeoLocatorController());

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Real-Time Location Tracker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('Current Location'),
//             SizedBox(
//               height: 300,
//               child: Obx(
//                 () => GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//                     zoom: 17,
//                     // target: LatLng(22.808354979825555, 89.54170587301584),
//                     target: controller.latLng.value,
//                   ),
//                   onTap: (LatLng? latlng) {
//                     debugPrint(latlng.toString());
//                   },
//                   onMapCreated: (GoogleMapController googleMapController) {
//                     controller.googleMapController = googleMapController;
//                     //_googleMapController = googleMapController;
//                   },
//                   trafficEnabled: true,
//                   zoomControlsEnabled: true,
//                   zoomGesturesEnabled: true,
//                   markers: <Marker>{
//                     const Marker(
//                       markerId: MarkerId('initial-position'),
//                       position: LatLng(22.808354979825555, 89.54170587301584),
//                     ),
//                     Marker(
//                       markerId: const MarkerId('home'),
//                       position:
//                           const LatLng(22.808528405114476, 89.54270113259554),
//                       infoWindow: const InfoWindow(title: 'Home'),
//                       onTap: () {
//                         // print('on tap on home');
//                       },
//                       icon: BitmapDescriptor.defaultMarkerWithHue(
//                         BitmapDescriptor.hueGreen,
//                       ),
//                       draggable: true,
//                       onDragStart: (LatLng onGragStart) {
//                         debugPrint('on Grag Strat $onGragStart');
//                       },
//                       onDragEnd: (LatLng onGragEnd) {
//                         debugPrint('on Grag End $onGragEnd');
//                       },
//                     ),
//                   },
//                   polylines: <Polyline>{
//                     Polyline(
//                       polylineId: const PolylineId('rendom_polyline'),
//                       color: Colors.black,
//                       jointType: JointType.round,
//                       // width: 1,
//                       visible: true,
//                       points: const <LatLng>[
//                         LatLng(22.812175874905716, 89.54040884971619),
//                         LatLng(22.806425239907373, 89.53198906034231),
//                         LatLng(22.803706684657275, 89.54534612596035),
//                       ],
//                       onTap: () {
//                         debugPrint('on tap Denger Circle ');
//                       },
//                     ),
//                   },
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 IconButton(onPressed: () {}, icon: const Icon(Icons.satellite))
//               ],
//             ),
//             Expanded(
//               child: Obx(
//                 () {
//                   final stream = controller.positionListStream.value;
//                   return StreamBuilder<List<Position>>(
//                     stream: stream,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return const Center(
//                             child: Text("No Position available"));
//                       }

//                       final List<Position> position = snapshot.data!;

//                       return ListView.builder(
//                           itemCount: position.length,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               title: Text('Current Position $index'),
//                               subtitle: Text(
//                                   'Latitude:${position[index].latitude} Longitude: ${position[index].longitude} '),
//                             );
//                           },
//                           reverse: true,
//                           shrinkWrap: true,
//                           clipBehavior: Clip.antiAlias);
//                     },
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // controller.getCurrentLocation();
//                     controller.updateCurrentLocation();
//                   },
//                   child: const Text('Current Location'),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
