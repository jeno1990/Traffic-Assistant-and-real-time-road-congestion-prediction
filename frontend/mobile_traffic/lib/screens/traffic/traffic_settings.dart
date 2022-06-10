import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/settings.dart';
import 'package:mobile_traffic/screens/driver/driver_settings.dart';

class TrafficSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image = "https://thumbs.dreamstime.com/z/police-traffic-stop-3354772.jpg";
    return SafeArea(
      child: Settings("Belete Hayilom",image),
    );
  }
}
