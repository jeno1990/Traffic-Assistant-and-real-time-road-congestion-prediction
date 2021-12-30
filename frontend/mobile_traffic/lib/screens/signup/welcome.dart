import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/screens/signup/login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              Color.fromRGBO(72, 131, 246, 0.7),
              Color.fromRGBO(0, 0, 0, 0.7)
            ],
                stops: [
              0.0,
              1.0
            ])),
      ),
      Container(
        padding: EdgeInsets.all(50),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          HeaderText("Welcome"),
          Button('Office', () => {Get.to(Login())},
              Color.fromRGBO(31, 36, 158, 0.42)),
          Button('Car Owner', () => {Get.to(Login())}
          , Color.fromRGBO(31, 36, 158, 0.42)),
          Button('Traffic Police', () => {Get.to(Login())}
          , Color.fromRGBO(31, 36, 158, 0.42)),
          Button('As Gust', () => {Get.to(Login())}
          , Color.fromRGBO(31, 36, 158, 0.42)),
        ]),
      )
    ])));
  }
}
