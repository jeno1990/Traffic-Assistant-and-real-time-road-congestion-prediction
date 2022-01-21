import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';

class DriverNotification extends StatelessWidget {
  final notificationController = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: Column(
          children: [
            Expanded(child: Obx(() {
             // print(notifiCationController.notificationList.length);
              return ListView.builder(
                  itemCount: notificationController.notificationList.length,
                  itemBuilder: (_, index) {
                    return ExpansionTile(
                        title: Text(notificationController
                            .notificationList[index].accident_type.toString()
                            ),
                        children: [
                          
                          Text("plate numver \$" +
                              notificationController
                                  .notificationList[index].plate_number
                                  .toString())
                        ]);
                  });
       })),
          ],
        )
        );
  }
}

Widget LoadNotifications() {
  return FutureBuilder(
    future: APIService.getNotification(),
    builder: (
      BuildContext context,
      AsyncSnapshot<List<NotificationModel>?> model,
    ) {
      if (model.hasData) {
        print('kkkk');
        return NotificationList(NotificationFromJson(model));
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget NotificationList(List<NotificationModel> notifications) {
  return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Text(notifications[index].accident_type.toString()),
            Text(notifications[index].plate_number.toString())
          ],
        );
      });
}
