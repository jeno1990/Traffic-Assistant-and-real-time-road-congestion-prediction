import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/crowded_streetController.dart';
import 'package:mobile_traffic/controllers/traffic_conrollers/traffic_notificationController.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
// import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';

class StreetList extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);
  bool isActive = true;
  final notificationController = Get.put(CrowdedStreetController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        //child: Obx(() {
        // print(notifiCationController.notificationList.length);
        // return
        // notificationController.isLoading.value
        //     ? Center(
        //         child: CircularProgressIndicator(
        //           color: Colors.black,
        //         ),
        //       )
        //     :
        //  child:     ListView.builder(
        //           itemCount: notificationController.notificationList.length,
        //           itemBuilder: (_, index) {
        //             return ExpansionTile(
        //                 title: Text(notificationController.notificationList[index]
        //                         [0] +
        //                     "-->" +
        //                     notificationController.notificationList[index][1]),
        //                 children: [
        //                   Text(notificationController.notificationList[index][2])
        //                 ]);
        //           }));
        // }
        //);

        child: GetBuilder<CrowdedStreetController>(
            builder: (notificationController) {
      return ListView.builder(
        padding: EdgeInsets.only(top: 0),
        // physics: NeverScrollableScrollPhysics(),
        itemCount: notificationController.notificationList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => Card(
          color: Colors.white70,
          child: ListTile(
            // shape: ShapeBorder(),
            tileColor: Colors.white,
            leading: CircleAvatar(
              child: Icon(Icons.car_repair), //Text("${index+1}"),
            ),
            title: Text(""),
              //notificationController.notificationList[index][0]+"-->"+notificationController.notificationList[index][1]),
            subtitle: Text(""),
              //"In  "+notificationController.notificationList[index][2]+"  street  crowdedness upto 345 cars with avarage speed 34"),
          ),
        ),
      );
    }));
  }
}
