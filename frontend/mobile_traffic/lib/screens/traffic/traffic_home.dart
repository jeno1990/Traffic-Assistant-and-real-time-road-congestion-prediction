import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/driver/map.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:mobile_traffic/screens/traffic/maps_traffic.dart';
import 'package:mobile_traffic/screens/traffic/report_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class TrafficHome extends StatelessWidget {
  // const DriverHome({ Key? key }) : super(key: key);
  late IO.Socket socket;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            width: size.width,
            height: size.height,
            color: Colors.blue,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  padding: EdgeInsets.all(10),
                  // color: Colors.red,
                  width: size.width,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HeaderText("Traffic Police"),
                      IconButton(
                        icon: Icon(Icons.visibility_off),
                        onPressed: () {
                          socket.disconnect();
                          print("discon");
                          socket.on("disconnect", (_) => print('Disconnected'));

                          //     Get.to(Login());
                          //  await   SharedService.logout(context);
                        },
                      ),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(10),
                //   margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                //   width: size.width,
                //   height: 40,
                //   // color: Colors.white,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: Colors.white),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Icon(Icons.search),
                //       SizedBox(
                //         width: 10,
                //       ),
                //       // TextFormField(
                //       //   decoration: InputDecoration(labelText: 'search here'),
                //       // style: TextStyle(),
                //       // )
                //     ],
                //   ),
                // ),
                Container(
                  width: size.width,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'Directions',
                      ),
                      Tab(
                        text: 'Report Form',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: size.width,
                    height: size.height * .692,
                    color: Colors.white,
                    child: TabBarView(children: [
                      // MapCircles(), //the first tab
                    //  ° N, ° E
MapTraffic(38.4955, 7.0504),
                     
                            Report_form(),
                          ],
                        ),
                      )
          )]),
          
                  ),
                //   bottomNavigationBar: BottomNavigation(),
                ));
              
            
  }
}
