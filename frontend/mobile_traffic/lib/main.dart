import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Login(),
    );
  }
}
