import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';
import 'package:get/get.dart';

class DriverHome extends StatelessWidget {
  // const DriverHome({ Key? key }) : super(key: key);

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
                      HeaderText("Driver"),
                      IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: ()async {
                          Get.to(Login());
                       await   SharedService.logout(context);
                          
                        },
                      ),
                    ],
                  ),
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
                      Icon(Icons.directions), //the first tab

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
      )     
    );
  }
}
