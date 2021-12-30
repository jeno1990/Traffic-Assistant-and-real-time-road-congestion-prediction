import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
import 'package:mobile_traffic/screens/traffic/violations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      Violations(),
    );
  }
}
