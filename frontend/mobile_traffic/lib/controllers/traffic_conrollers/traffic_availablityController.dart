import 'dart:convert';

import 'package:get/get.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/models/traffic_notification_model.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TrafficAvailabilityController extends GetxController {
  late IO.Socket socket;
  double? latitude;
  double? longtude;
  var isLoading = true.obs;
  var online = true;
  


  void inActive() {
    socket.disconnect();
  }

  var notificationTrafficList =
      List<TrafficNotification>.empty(growable: true).obs;

  Future<void> initSocket() async {
    try {
      socket = IO.io("http://10.5.217.74:5000", <String, dynamic>{
        "transports": ["websocket"],
        "autoConnect": true,
      });
      socket.on("userCount", (data) async {
        print(data);
        //   final parsedJson = jsonDecode(data);
// type: Restaurant
        notificationTrafficList.add(
            TrafficNotification("violationType", "plateNumber", "details"));

        final trafficNotification = await TrafficNotification.fromJson(data);
        notificationTrafficList.add(trafficNotification);
        update();

        print(notificationTrafficList.length);
      });
      socket.connect();
      socket.onConnect((data) => print('Connected: ${socket.id}'));
      print(socket.connected);
    } catch (e) {
      print(e.toString());
    }
  }


}
