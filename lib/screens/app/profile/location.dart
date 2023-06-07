// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class Maps extends StatefulWidget {
//   const Maps({Key? key}) : super(key: key);

//   @override
//   State<Maps> createState() => _MapsState();
// }

// class _MapsState extends State<Maps> {
//   late Set<Marker> markers = <Marker>{};
//   LatLng latLng = const LatLng(24.0192811, 52.8593783);
//   late CameraPosition cameraPosition;
//   final Completer<GoogleMapController> _controller = Completer();

//   @override
//   void initState() {
//     super.initState();
//     // getCurrentLocation();
//   }

//   getCurrentLocation() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error('Location permissions are denied');
//       }
//     }

//     if (permission == LocationPermission.deniedForever) {
//       return Future.error(
//           'Location permissions are permanently denied, we cannot request permissions.');
//     }

//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     setState(() {
//       latLng = LatLng(position.latitude, position.longitude);
//     });
//     cameraPosition = CameraPosition(target: latLng, zoom: 5);
//     changeLocationMarker();
//   }

//   changeLocationMarker() {
//     setState(() {
//       markers.clear();
//       markers.add(
//         Marker(
//           markerId: MarkerId(latLng.toString()),
//           position: latLng,
//           flat: true,
//           icon: BitmapDescriptor.defaultMarker,
//         ),
//       );
//       changeCameraLocation();
//     });
//   }

//   changeCameraLocation() async {
//     GoogleMapController controller = await _controller.future;
//     controller.animateCamera(
//       CameraUpdate.newCameraPosition(
//         CameraPosition(
//           target: latLng,
//           zoom: 14,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     cameraPosition = CameraPosition(target: latLng);
//     return Scaffold(
//       body: GoogleMap(
//         zoomControlsEnabled: true,
//         initialCameraPosition: cameraPosition,
//         onMapCreated: (GoogleMapController controller) {
//           // _controller.complete(controller);
//         },
//         markers: markers,
//         onTap: (argument) {
//           // setState(() {
//           //   latLng = argument;
//           //   changeLocationMarker();
//           // });
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMapPage extends StatefulWidget {
  @override
  _MyMapPageState createState() => _MyMapPageState();
}

class _MyMapPageState extends State<MyMapPage> {
  GoogleMapController? mapController;

  final LatLng _center =
      const LatLng(37.7749, -122.4194); // San Francisco coordinates

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps Demo'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
    );
  }
}
