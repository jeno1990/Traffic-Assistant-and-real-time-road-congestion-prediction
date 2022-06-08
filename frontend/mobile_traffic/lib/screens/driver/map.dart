import 'package:geolocator/geolocator.dart';

import './map_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapCircles extends StatefulWidget {
  const MapCircles({Key? key}) : super(key: key);

  @override
  _MapCirclesState createState() => _MapCirclesState();
}

class _MapCirclesState extends State<MapCircles> {
  GoogleMapController? _controller;
  Set<Circle> _circles = Set<Circle>();
  late Position currentPostition;
  var geoLocator = Geolocator();
  void locatePostion() async {
    Position positon = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPostition = positon;

    print(positon.latitude);
    print(
        "       kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk                                                ");

    print(positon.longitude);

    LatLng latLngPostion = LatLng(positon.latitude, positon.longitude);
    CameraPosition currentCameraPostion =
        new CameraPosition(target: latLngPostion, zoom: 14);

    _controller!
        .animateCamera(CameraUpdate.newCameraPosition(currentCameraPostion));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return
        //Scaffold(
        //body:
        GoogleMap(
      initialCameraPosition: _kGooglePlex,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      zoomControlsEnabled: true,
      zoomGesturesEnabled: true,
      circles: _circles,
      onLongPress: (LatLng latLng) {
        setState(() {
          _circles.add(Circle(
            circleId: CircleId('red'),
            center: latLng,
            radius: 300,
            fillColor: Colors.red.shade500.withOpacity(.5),
            strokeColor: Colors.red.shade300.withOpacity(.7),
            strokeWidth: 5,
          ));
        });
      },
      onTap: (LatLng latLng) {
        _circles.add(Circle(
          consumeTapEvents: true,
          circleId: CircleId('blue'),
          center: latLng,
          radius: 500.0,
          fillColor: Colors.blue.shade500.withOpacity(.5),
          strokeColor: Colors.blue.shade700.withOpacity(.7),
          strokeWidth: 5,
        ));

        setState(() {
          _controller?.animateCamera(CameraUpdate.newLatLng(latLng));
        });
      },
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller!.setMapStyle(MapStyle().retro);
        locatePostion();
      },
    );
    // );
  }
}
