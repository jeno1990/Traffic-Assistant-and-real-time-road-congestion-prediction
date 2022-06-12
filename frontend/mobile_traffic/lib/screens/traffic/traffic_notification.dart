import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_notificationController.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/traffic/reported_accident.dart';
import 'package:mobile_traffic/screens/traffic/violations.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:mobile_traffic/services/shared_services.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TrafficNotification extends StatelessWidget {
  
  final notificationController = Get.put(TrafficNotificationController());
  @override
  Widget build(BuildContext context) {
         //  print(notificationController.notificationTrafficList);

    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Container(
          width: size.width,
          height: size.height,
          color: Colors.blue,
          child: Column(children: [
            Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                padding: EdgeInsets.all(10),
                // color: Colors.red,
                width: size.width,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderText("Traffic Police"),
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () async {
                        // Get.to(Login());
                        // await SharedService.logout(context);
                      },
                    ),
                  ],
                )),
            Container(
              width: size.width,
              child: TabBar(
                tabs: [
                  Tab(
                    text: 'Driving Violations',
                  ),
                  Tab(
                    text: 'Reported Cases',
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              width: size.width,
              height: size.height * .692,
              color: Colors.white,
              child: TabBarView(
                children: [
                  Violations(),
                  ReportedAccident()
                ],
              ),
            ))
          ]),
        )));
  }
}
