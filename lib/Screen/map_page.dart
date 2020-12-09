import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappage extends StatelessWidget {
// Declare a field that holds the Todo
  final latitude;
  final longitude;
  final name;

// In the constructor, require a Todo.
  Mappage({Key key, @required this.longitude, this.latitude, this.name})
      : super(key: key);
  String data;

  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    print(longitude.toString());
    print(latitude.toString());
    Completer<GoogleMapController> _controller = Completer();
    Set<Marker> markers = Set();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    );

// Create a new marker
    Marker resultMarker = Marker(
      icon: BitmapDescriptor.fromAsset("assets/mental-health.png"),
      markerId: MarkerId(name),
      infoWindow: InfoWindow(title: name),
      position: LatLng(latitude, longitude),
    );
// Add it to Set
    markers.add(resultMarker);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text("Location", textAlign: TextAlign.center),
        ),
        //
        body: Container(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
        ));
  }
}
