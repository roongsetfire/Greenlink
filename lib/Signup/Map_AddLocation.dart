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
  List<Marker> myMarker = [];
  String locationPoint;

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
      zoom: 17,
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
        title: Text("จิ้มเพื่อเลือกที่อยู่ปัจจุบัน",style: TextStyle(fontFamily: 'Kanit'),),
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
        },
        markers: Set.from(myMarker),
        onTap: _handleTap,
      ),
      floatingActionButton: Column(
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 600, 70, 0),
            child: FloatingActionButton.extended(
              onPressed: _goToMe,
              label: Text(
                'ไปที่ตำแหน่งปัจจุบัน',
                style: TextStyle(fontFamily: 'Kanit'),
              ),
              icon: Icon(Icons.near_me),
            ),
          ),
          Container(
            width: 200,
            margin: EdgeInsets.fromLTRB(0, 20, 70, 0),
            child: FloatingActionButton.extended(
              shape: StadiumBorder(
                side: BorderSide(
                  color: Colors.blue,width: 6
                )
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                _sendDataBack(context);
              },
              label: Text(
                'บันทึก',
                style: TextStyle(fontFamily: 'Kanit', fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold),
              ),
              icon: Icon(
                Icons.add_location_alt_outlined,color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  _handleTap(LatLng tappedPoint) {
    setState(() {
      print("${tappedPoint.latitude}, ${tappedPoint.longitude}");
      locationPoint =
          'Lat : ${tappedPoint.latitude.toString()}, Lng : ${tappedPoint.longitude.toString()}';
      myMarker = [];
      myMarker.add(
        Marker(
            markerId: MarkerId(tappedPoint.toString()),
            position: tappedPoint,
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)),
      );
    });
  }

  void _sendDataBack(BuildContext context) {
    Navigator.pop(context, locationPoint);
  }
}
