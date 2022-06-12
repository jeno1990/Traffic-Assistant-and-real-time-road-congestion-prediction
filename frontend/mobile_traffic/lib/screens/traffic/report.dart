import "package:flutter/material.dart";
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/traffic/maps_traffic.dart';

class Report extends StatelessWidget {
  //const Report({ Key? key }) : super(key: key);
Report(
      this.plateNumber, this.violationType, this.longtuide, this.latitude);
  final String plateNumber;
  final String violationType;
  final double longtuide;
  final double latitude;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
        ),
          body: Column(
        children: [
         
          Container(
            decoration: BoxDecoration(
                          color: Colors.white,

                        borderRadius: BorderRadius.circular(10)
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
               
                    Text(violationType,
                    style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold)
                    ),
                  
                    Text(plateNumber,style:TextStyle(
                        fontWeight: FontWeight.bold,

                    )),
              ],
            ),
          ),

            Expanded(
              child: MapTraffic(latitude,longtuide),
            ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button("Decline",(){},Colors.red)
                  ,
                    Button("Accept",(){},Colors.green),
                  ],
                ),
        ],
      )),
    );
  }
}
