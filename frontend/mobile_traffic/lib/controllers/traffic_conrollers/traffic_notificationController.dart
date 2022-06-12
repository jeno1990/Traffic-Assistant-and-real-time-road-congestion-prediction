import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/models/traffic_notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TrafficNotificationController extends GetxController {
  late IO.Socket socket;
  double? latitude;
  double? longtude;

  // ignore: deprecated_member_use
  var notificationList = List<NotificationModel>.empty(growable: true).obs;
  var isLoading = true.obs;
  var online = true;
  @override
  void onInit() {
    print("hhhh" + notificationList.toString());

    getNotification();
    //trafficDashboard;
    initSocket();
    update();
    super.onInit();
  }

  void inActive() {
    socket.disconnect();
    // to check if the traffic is online or offline
  }

  var notificationTrafficList =
      List<TrafficNotification>.empty(growable: true).obs;

  //   [
  //     "A7897",
  //     "80"
  //   ],
  //   [
  //     "A78973",
  //     "100"
  //   ],
  //   [
  //     "B70965",
  //     "180"
  //   ],
  //   [
  //     "A789790",
  //     "89"
  //   ]
  // ];

  Future<void> initSocket() async {
    try {
      socket = IO.io("http://10.5.217.74:5000", <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": true,
      });
      socket.connect();
      socket.onConnect((data)=>
        print("connectedddd")
      );
      
        print(socket.connected);
      print("in socket");
      socket.on("message", (data) async {
        print("data");

        final trafficNotification = TrafficNotification.fromJson(data);
        notificationTrafficList.add(trafficNotification);

        if (notificationTrafficList.length <= 5) {
          if (notificationTrafficList.length == 5) {
            Timer timer = new Timer(new Duration(seconds: 60), () {
              notificationTrafficList.removeLast();
              print("removed after 60  seconds");
            });
          }
          update();
        }
      });

      print(notificationTrafficList.length);

      socket.connect();
      socket.onConnect((data) => print('Connected: ${socket.id}'));
      print(socket.connected);
    } catch (e) {
      print(e.toString());
    }
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
