import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
class Violations extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: size.height,
            width: size.width ,
            child: Stack(
              children: [
                Traffc_background("violations"),
              ],
            ),
          ),
      ),
    );
  }
}