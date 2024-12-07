// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen({super.key});

//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   late GoogleMapController _googleMapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Google maps and Geo-locator'),
//       ),
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: const CameraPosition(
//           zoom: 17,
//           target: LatLng(22.808354979825555, 89.54170587301584),
//         ),
//         onTap: (LatLng? latlng) {
//           debugPrint(latlng.toString());
//         },
//         onMapCreated: (GoogleMapController googleMapController) {
//           _googleMapController = googleMapController;
//         },
//         trafficEnabled: true,
//         zoomControlsEnabled: true,
//         zoomGesturesEnabled: true,
//         markers: <Marker>{
//           const Marker(
//             markerId: MarkerId('initial-position'),
//             position: LatLng(22.808354979825555, 89.54170587301584),
//           ),
//           Marker(
//             markerId: const MarkerId('home'),
//             position: const LatLng(22.808528405114476, 89.54270113259554),
//             infoWindow: const InfoWindow(title: 'Home'),
//             onTap: () {
//               print('on tap on home');
//             },
//             icon: BitmapDescriptor.defaultMarkerWithHue(
//               BitmapDescriptor.hueGreen,
//             ),
//             draggable: true,
//             onDragStart: (LatLng onGragStart) {
//               debugPrint('on Grag Strat $onGragStart');
//             },
//             onDragEnd: (LatLng onGragEnd) {
//               debugPrint('on Grag End $onGragEnd');
//             },
//           ),
//         },
//         circles: <Circle>{
//           Circle(
//               circleId: const CircleId('denger-ariya'),
//               fillColor: Colors.red.withOpacity(0.3),
//               center: const LatLng(22.80959990971731, 89.54586211591959),
//               radius: 300,
//               strokeWidth: 1,
//               visible: true,
//               onTap: () {
//                 debugPrint('on tap Denger Circle ');
//               }),
//           Circle(
//               circleId: const CircleId('Green-ariya'),
//               fillColor: Colors.green.withOpacity(0.3),
//               center: const LatLng(22.809922255717847, 89.54938922077417),
//               radius: 100,
//               strokeWidth: 1,
//               visible: true,
//               onTap: () {
//                 debugPrint('on tap Green Circle ');
//               }),
//         },
//         polylines: <Polyline>{
//           Polyline(
//             polylineId: const PolylineId('rendom_polyline'),
//             color: Colors.black,
//             jointType: JointType.round,
//             // width: 1,
//             visible: true,
//             points: const <LatLng>[
//               LatLng(22.812175874905716, 89.54040884971619),
//               LatLng(22.806425239907373, 89.53198906034231),
//               LatLng(22.803706684657275, 89.54534612596035),
//             ],
//             onTap: () {
//               debugPrint('on tap Denger Circle ');
//             },
//           ),
//         },
//         polygons: <Polygon>{
//           Polygon(
//             polygonId: const PolygonId('rendom_polyline'),
//             fillColor: Colors.black.withOpacity(0.5),
//             strokeWidth: 1,
//             visible: true,
//             points: const <LatLng>[
//               LatLng(22.808028655205696, 89.55341454595327),
//               LatLng(22.814839869249212, 89.54782348126173),
//               LatLng(22.814745301432453, 89.55570850521326),
//             ],
//             onTap: () {
//               debugPrint('on tap Denger Circle ');
//             },
//           ),
//         },
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _googleMapController.animateCamera(
//             CameraUpdate.newCameraPosition(
//               const CameraPosition(
//                 zoom: 17,
//                 target: LatLng(
//                   22.808354979825555,
//                   89.54170587301584,
//                 ),
//               ),
//             ),
//           );
//         },
//         child: const Icon(Icons.location_history_outlined),
//       ),
//     );
//   }
// }
