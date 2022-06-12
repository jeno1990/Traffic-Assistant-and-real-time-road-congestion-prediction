import 'package:geolocator/geolocator.dart';

import './map_style.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTraffic extends StatefulWidget {
  //const MapTraffic({Key? key}) : super(key: key);
  late final double longtiude;
  late final double latitude;
  MapTraffic(this.longtiude, this.latitude);
  @override
  _MapTrafficState createState() => _MapTrafficState();
}

class _MapTrafficState extends State<MapTraffic> {
  GoogleMapController? _controller;
  //Set<Circle> _circles = Set<Circle>();
  late Position currentPostition;
  var geoLocator = Geolocator();

  void locatePostion() async {
    //   Position positon = await Geolocator.getCurrentPosition(
    //       desiredAccuracy: LocationAccuracy.high);
    //   currentPostition = positon;

    //   // print(positon.latitude);
    //   // print(
    //   //     "       kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk                                                ");

    //   // print(positon.longitude);

    LatLng latLngPostion = LatLng(widget.latitude, widget.longtiude);
    CameraPosition currentCameraPostion =
        new CameraPosition(target: latLngPostion, zoom: 14);

    _controller!
        .animateCamera(CameraUpdate.newCameraPosition(currentCameraPostion));
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Set<Circle> circles = Set.from([
    Circle(
      circleId: CircleId('red'),
      center: LatLng(38.4955, 7.0504),
      radius: 400,
      fillColor: Colors.red.shade500.withOpacity(.5),
      strokeColor: Colors.red.shade300.withOpacity(.7),
      strokeWidth: 5,
    )
  ]);
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
       circles: circles,
      // onLongPress: (LatLng latLng) {
      //   setState(() {
      //     _circles.add(Circle(
      //       circleId: CircleId('red'),
      //       center: latLng,
      //       radius: 300,
      //       fillColor: Colors.red.shade500.withOpacity(.5),
      //       strokeColor: Colors.red.shade300.withOpacity(.7),
      //       strokeWidth: 5,
      //     ));
      //   });
      // },
      // onTap: (LatLng latLng) {
      //   _circles.add(Circle(
      //     consumeTapEvents: true,
      //     circleId: CircleId('blue'),
      //     center: latLng,
      //     radius: 500.0,
      //     fillColor: Colors.blue.shade500.withOpacity(.5),
      //     strokeColor: Colors.blue.shade700.withOpacity(.7),
      //     strokeWidth: 5,
      //   ));

      //   setState(() {
      //     _controller?.animateCamera(CameraUpdate.newLatLng(latLng));
      //   });
      // },
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
        _controller!.setMapStyle(MapStyle().retro);
        locatePostion();
        setState(() {
          circles.add(Circle(
            circleId: CircleId('red'),
            center: LatLng(38.4955, 7.0504),
          ));
        });
      //  onCameraMove= null;

        circles = circles;
      },
    );
    // );
  }
}
