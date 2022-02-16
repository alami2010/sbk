import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(48.8566, 2.3522),
    zoom: 9,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 0,
      target: LatLng(48.8566, 2.3522),
      tilt: 0,
      zoom: 0);
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{}; // CLASS MEMBER, MAP OF MARKS

  void _add() {
    var markerIdVal = 'Salsa';
    var markerIdVal2 = 'batchata';

    final MarkerId markerId = MarkerId(markerIdVal);
    final MarkerId markerId2 = MarkerId(markerIdVal2);

    // creating a new MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
          48.752493,
          2.374058
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });


    // creating a new MARKER
    final Marker marker2 = Marker(
      markerId: markerId2,
      position: LatLng(
          48.781080,
          2.035930
      ),
      infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
      onTap: () {
        //_onMarkerTapped(markerId);
      },
    );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
      markers[markerId2] = marker2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values), // YOUR MARKS IN MAP
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _add,
        label: Text('Factory Club*'
            ''
            ''
            'ù!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}