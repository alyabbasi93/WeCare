import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  Map({Key key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  var latitude = 37.42796133580664;
  var longitude = -122.085749655962;
  var name;

  @override
  initState() {}

  @override
  Widget build(BuildContext context) {
    print(longitude.toString());
    print(latitude.toString());
    Completer<GoogleMapController> _controller = Completer();
    Set<Marker> markers = Set();
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962),
      zoom: 14.4746,
    );

// Create a new marker
    /* Marker resultMarker = Marker(
      icon: BitmapDescriptor.fromAsset("assets/mental-health.png"),
      markerId: MarkerId(name),
      infoWindow: InfoWindow(title: name),
      position: LatLng(latitude, longitude),
    );*/
// Add it to Set
    //markers.add(resultMarker);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Location", textAlign: TextAlign.center),
      ),
      //
      body: Container(
        height: 100,
        child: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
