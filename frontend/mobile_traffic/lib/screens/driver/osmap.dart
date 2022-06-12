// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:latlng/latlng.dart';
// import 'package:latlong2/latlong.dart';


// class OSMap extends StatefulWidget {
//   // const OSMap({ Key? key }) : super(key: key);
//   final double lat;
//   final double lon;
//   OSMap(this.lat,this.lon);
//   @override
//   _OSMapState createState() => _OSMapState();
// }

// class _OSMapState extends State<OSMap> {
  
//   @override
//   Widget build(BuildContext context) {
//     LatLng location = LatLng(widget.lat, widget.lon);
//     return FlutterMap(
//     options: MapOptions(
      
//       // onTap: (point){},
//       enableScrollWheel: true,
//       //  bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
//       //  boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
//       center: location,
//       zoom: 17.0,
      
//     ),
//     layers: [
//       TileLayerOptions(
//         urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//         subdomains: ['a', 'b', 'c'],
//         attributionBuilder: (_) {
//           return Text("");
//         },
//       ),
//       MarkerLayerOptions(
//         markers: [
//           Marker(
//             width: 80.0,
//             height: 80.0,
//             point: location,
//             builder: (ctx) =>Icon(
//               Icons.location_on,
//               color: Colors.red,
//               size: 50,)),
//         ],
//       ),
//     ],
//   );
//   }
// }