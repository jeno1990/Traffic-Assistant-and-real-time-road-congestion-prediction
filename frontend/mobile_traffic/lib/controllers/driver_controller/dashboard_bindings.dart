import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_accidentController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_dashboardController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_reminderController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_settingsController.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_toolController.dart';


class DashBoardBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<DriverDashboardController>(() => DriverDashboardController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<AccidentController>(() => AccidentController());
    Get.lazyPut<ReminderController>(() => ReminderController());
    Get.lazyPut<ToolController>(() => ToolController());


    
    
  }
  
  
}