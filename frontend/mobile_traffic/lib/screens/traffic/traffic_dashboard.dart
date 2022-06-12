import 'package:flutter/material.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_dashboardController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_dashboardController.dart';
import 'package:mobile_traffic/screens/driver/custom_search_delegate.dart';

import 'package:mobile_traffic/screens/driver/driver_home.dart';
import 'package:mobile_traffic/screens/driver/driver_notification.dart';
import 'package:mobile_traffic/screens/driver/driver_reminder.dart';
import 'package:mobile_traffic/screens/driver/driver_settings.dart';
import 'package:mobile_traffic/screens/driver/driver_tool.dart';

import 'package:get/get.dart';
import 'package:mobile_traffic/screens/driver/search.dart';
import 'package:mobile_traffic/screens/traffic/traffic_home.dart';
import 'package:mobile_traffic/screens/traffic/traffic_notification.dart';
import 'package:mobile_traffic/screens/traffic/traffic_settings.dart';

class TrafficDashBoard extends StatelessWidget {
  // const DriverHome({ Key? key }) : super(key: key);
 TrafficDashboardController controller = Get.put(TrafficDashboardController());

  @override
  Widget build(BuildContext context) {
   // print(driverDashBoardController.buttomIndex);
    return GetBuilder<TrafficDashboardController>(
     init:TrafficDashboardController(), 
      builder: (controller) {
      
      return Scaffold(
          body: SafeArea(
              child: IndexedStack(
            index: controller.buttomIndex,
            children: [
              TrafficHome(),
              SearchScreen(),
              TrafficNotification(),
              TrafficSettings(),
            ],
          )),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
               BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notification_add),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: controller.buttomIndex,
            selectedItemColor: Color.fromRGBO(47, 128, 237, 1),
            onTap: controller.changeButtomIndex,
          ));
    });
  }
}
