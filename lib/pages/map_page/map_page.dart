import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:hotels/models/hotels.dart';

class MapPage extends StatelessWidget {
  MapPage({
    Key? key,
    this.hotelData,
  }) : super(key: key);
  final HotelData? hotelData;
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Map"),
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: initialLocation(
              double.parse(hotelData!.latitude!),
              double.parse(hotelData!.longitude!)),
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: hotelLocation(hotelData!),
        ));
  }

  CameraPosition initialLocation(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 7.7,
    );
  }

  Set<Marker> hotelLocation(HotelData hotelData) {
    final latitude = double.parse(hotelData.latitude!);
    final longitude = double.parse(
      hotelData.longitude!,
    );
    final id = hotelData.id;
    Set<Marker> markersList = {};

    markersList.add(
      Marker(
          markerId: MarkerId(id.toString()),
          position: LatLng(latitude, longitude),
          infoWindow:
              InfoWindow(title: hotelData.title, snippet: hotelData.address),
          rotation: 0,
          draggable: false,
          zIndex: 2,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.defaultMarker),
    );

    return markersList;
  }
}
