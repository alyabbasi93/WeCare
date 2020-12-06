import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mappage extends StatefulWidget {
  Mappage({Key key}) : super(key: key);

  @override
  _MappageState createState() => _MappageState();
}

class _MappageState extends State<Mappage> {
  //initilize variable
  var latitude = 37.42796133580664;
  var longitude = -122.085749655962;
  var name = 'abc';

  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    print(longitude.toString());
    print(latitude.toString());

    //define google map controller
    Completer<GoogleMapController> _controller = Completer();
    //set Marker
    Set<Marker> markers = Set();
    // inital map Camera position
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
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

    // Map Design
    return Scaffold(
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          markers: markers,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
