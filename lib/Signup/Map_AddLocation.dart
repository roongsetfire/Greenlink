import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSignUp extends StatefulWidget {
  @override
  _MapSignUpState createState() => _MapSignUpState();
}

class _MapSignUpState extends State<MapSignUp> {
  Completer<GoogleMapController> _controller = Completer();
  LocationData currentLocation;

  Future<LocationData> getCurrentLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        // Permission denied
      }
      return null;
    }
  }

  Future _goToMe() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(currentLocation.latitude, currentLocation.longitude),
      zoom: 16,
    )));
  }

  Future _zoomOutToBangkok() async {
    final GoogleMapController controller = await _controller.future;
    currentLocation = await getCurrentLocation();
    controller.animateCamera(
        CameraUpdate.newLatLngZoom(LatLng(13.6846021, 100.5883304), 10));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add Location"),
        actions: [
          IconButton(onPressed: _zoomOutToBangkok, icon: Icon(Icons.home))
        ],
      ),
      body: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.terrain,
          initialCameraPosition:
              CameraPosition(target: LatLng(13.7650836, 100.5379664), zoom: 16),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToMe,
        label: Text('My location'),
        icon: Icon(Icons.near_me),
      ),
    );
  }
}
