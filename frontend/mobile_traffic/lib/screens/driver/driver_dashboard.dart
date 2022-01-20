import 'package:flutter/material.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_dashboardController.dart';

import 'package:mobile_traffic/screens/driver/driver_home.dart';
import 'package:mobile_traffic/screens/driver/driver_notification.dart';
import 'package:mobile_traffic/screens/driver/driver_reminder.dart';
import 'package:mobile_traffic/screens/driver/driver_settings.dart';
import 'package:mobile_traffic/screens/driver/driver_tool.dart';

import 'package:get/get.dart';

class DriverDashBoard extends StatelessWidget {
  // const DriverHome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverDashboardController>(builder: (controller) {
      return Scaffold(
          body: SafeArea(
              child: IndexedStack(
                index: controller.buttomIndex,
            children: [
              DriverHome(),
              DriverTool(),
              DriverReminder(),
             // DriverNotification(),
              DriverSettings(),
            ],
          )),
          bottomNavigationBar:BottomNavigationBar(
      type:BottomNavigationBarType.fixed,
       items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Tools',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Reminder',
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
        selectedItemColor: Color.fromRGBO(47, 128, 237, 1)
,
        onTap: controller.changeButtomIndex,
      ));
    });
  }
}
