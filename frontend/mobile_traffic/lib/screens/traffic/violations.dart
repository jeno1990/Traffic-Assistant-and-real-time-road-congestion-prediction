import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_notificationController.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
// import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/traffic/report.dart';

class Violations extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);
  bool isActive = true;
  //final notificationController = Get.put(TrafficNotificationController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<TrafficNotificationController>(
        builder: (notificationController) {
      return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        // physics: NeverScrollableScrollPhysics(),
        itemCount: notificationController.notificationTrafficList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          color: Colors.white70,
          child: InkWell(
            onLongPress: () {
              Get.to(Report(
                  notificationController
                      .notificationTrafficList[index].plateNumber,
                  notificationController
                      .notificationTrafficList[index].violationType,
                  notificationController
                      .notificationTrafficList[index].longtuide,
                  notificationController
                      .notificationTrafficList[index].latitiude));
            },
            child: ListTile(
              // shape: ShapeBorder(),
              tileColor: Colors.white,
              leading: CircleAvatar(
                child: Icon(Icons.car_repair), //Text("${index+1}"),
              ),
              title: Text("Plate Number" +
                  notificationController
                      .notificationTrafficList[index].plateNumber),
              subtitle: Text(notificationController
                      .notificationTrafficList[index].violationType +
                  "KMPH"),
            ),
          ),
        ),
      );
    });
  }
}
