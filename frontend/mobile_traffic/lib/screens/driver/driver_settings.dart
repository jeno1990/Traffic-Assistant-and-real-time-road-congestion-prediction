import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobile_traffic/screens/common_components/settings.dart';

class DriverSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image =
        "https://static.remove.bg/remove-bg-web/035676ee65d6ce9f128769532ffdff315f3005c7/assets/start-1abfb4fe2980eabfbbaaa4365a0692539f7cd2725f324f904565a9a744f8e214.jpg";
    return Settings("Jeno ", image);
  }
}
