import 'package:get/get.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';

class TrafficNotificationController extends GetxController {
  // ignore: deprecated_member_use
  var notificationList = List<NotificationModel>.empty(growable: true).obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    print("hhhh" + notificationList.toString());

    getNotification();
    update();
    super.onInit();
  }

  void getNotification() async {
    try {
      isLoading(true);

      var notifications = await APIService.getNotification();
      print(notifications);

      if (notifications != null) {
        notificationList.value = notifications;
      }
    } finally {
      // TODO
      isLoading(false);
    }
  }
}
