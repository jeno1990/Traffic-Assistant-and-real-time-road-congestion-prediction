import 'package:get/get.dart';

import 'package:get/get.dart';

class TrafficDashboardController extends GetxController {
  var buttomIndex = 0;
  void changeButtomIndex(int index) {
    buttomIndex = index;
    update();
  }
}
