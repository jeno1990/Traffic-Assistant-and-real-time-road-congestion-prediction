import 'package:get/get.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';

class NotificationController extends GetxController {
  // ignore: deprecated_member_use
  var notificationList = List<NotificationModel>.empty().obs;
  @override
  void onInit() {
    getNotification();
    super.onInit();
  }

  void getNotification() async {
    var notifications = await APIService.getNotification();
    if (notifications != null) {
      notificationList.value = notifications;
    }
  }
}
