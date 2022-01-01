import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/driver/driverHome.dart';

import 'package:mobile_traffic/screens/signup/welcome.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/screens/traffic/violations.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Welcome()

    );
  }
}
