import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:location/location.dart';
// import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:mobile_traffic/controllers/location_controller.dart';

class DriverHome extends StatelessWidget {
  // const DriverHome({ Key? key }) : super(key: key);
  LocationController location_controller = Get.put(LocationController());
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
                  padding:EdgeInsets.all(10),
                  // color: Colors.red,
                  width: size.width,
                  height: 40,
                  child: HeaderText("Driver"),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: size.width,
                  height: 40,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.search),
                      SizedBox(
                        width: 10,
                      ),
                      // TextFormField(
                      //   decoration: InputDecoration(labelText: 'search here'),
                      // style: TextStyle(),
                      // )
                    ],
                  ),
                ),
                Container(
                  width: size.width,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: 'Directions',
                      ),
                      Tab(
                        text: 'To find traffic police',
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
                      Obx(()=>
                        FlutterMap(
                          options: MapOptions(
                            
                            // onTap: (point){
                            //   location =
                            // },
                            enableScrollWheel: true,
                            center: LatLng(location_controller.getLocationData().latitude as double ,location_controller.getLocationData().longitude as double),
                            zoom: 17.0,
                            
                          ),
                          layers: [
                            TileLayerOptions(
                              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                              subdomains: ['a', 'b', 'c'],
                              attributionBuilder: (_) {
                                return Text("");
                              },
                            ),
                            MarkerLayerOptions(
                              markers: [
                                Marker(
                                  width: 80.0,
                                  height: 80.0,
                                  point: LatLng(location_controller.getLocationData().latitude as double,location_controller.getLocationData().longitude as double),
                                  builder: (ctx) =>Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 50,)),
                              ],
                            ),
                          ],
                        ),
                      ), //the first tab

                      Container(
                        //the second tab
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                width: size.width,
                                height: 40,
                                child: Text(
                                  "accident report form",
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                )),
                            Accident_Form(),
                          ],
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigation()),
    );
  }
}