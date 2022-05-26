import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_accidentController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_dashboardController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_reminderController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_settingsController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_toolController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_dashboardController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_notificationController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_settingsController.dart';


class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TrafficDashboardController>(() => TrafficDashboardController());
    Get.lazyPut<TrafficNotificationController>(() => TrafficNotificationController());
    Get.lazyPut<TrafficSettingsController>(() => TrafficSettingsController());


    
    
  }
  
  
}