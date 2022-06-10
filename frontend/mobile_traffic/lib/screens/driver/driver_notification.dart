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
           return  notificationController.isLoading.value?
              Center(
               child: CircularProgressIndicator(color: Colors.black,),
             ):
               ListView.builder(
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
