import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:searchfield/searchfield.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/controllers/driver_controller/crowded_streetController.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/driver/crowdedStreet.dart';
import 'package:mobile_traffic/services/api_service.dart';

class CrowdedStreet extends StatefulWidget {
  @override
  _CrowdedStreetState createState() => _CrowdedStreetState();
}

class _CrowdedStreetState extends State<CrowdedStreet> {
  CrowdedStreetController listOfRoads = Get.find<CrowdedStreetController>();
  final List<Map<String, dynamic>> _roles = [
    {"name": "Ayer Tena", "desc": "Having full access rights", "role": 1},
    {
      "name": "Megenagna",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "4 kilo",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Shiromeda",
      "desc": "Having full access rights of a Organization",
      "role": 2
    },
    {
      "name": "Mexico",
      "desc": "Having Magenent access rights of a Organization",
      "role": 3
    },
    {
      "name": "Bole",
      "desc": "Having Technician Support access rights",
      "role": 4
    },
    {"name": "22", "desc": "Having Customer Support access rights", "role": 5},
    {"name": "staduim", "desc": "Having End User access rights", "role": 6},
  ];
  var source = "";
  var destination = "";
  var listRoad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Road Crowdedness'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownFormField<Map<String, dynamic>>(
              onEmptyActionPressed: () async {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Source"),
              onSaved: (dynamic str) {},
              onChanged: (dynamic str) {
                print(str);
                setState(() {
                  // source = str['name'];
                  // state.didChange(newValue);
                });
              },
              validator: (dynamic str) {},
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['name'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => _roles,
              selectedFn: (dynamic item1, dynamic item2) {
                if (item1 != null && item2 != null) {
                  return item1['name'] == item2['name'];
                }
                return false;
              },
              filterFn: (dynamic item, str) =>
                  item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                  ListTile(
                title: Text(item['name']),
                subtitle: Text(
                  item['desc'] ?? '',
                ),
                tileColor:
                    focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                onTap: onTap,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            DropdownFormField<Map<String, dynamic>>(
              onEmptyActionPressed: () async {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Destination"),
              onSaved: (dynamic str) {
                //  print("strrrrrrrrrrrrrrrrrrrrrrrrrrkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
              },
              onChanged: (dynamic str) {
                print(
                    "strrrrrrrrrrrrrrjjjjjjjjjjjrrrrrrrrrrrrkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                //  Json.decode(str);
                // destination=str['name'];
                print(str);

                User user = User.fromJson(str);
                setState(() {
                  destination = str;
                  // state.didChange(newValue);
                });
                print(user.name);
              },
              validator: (dynamic str) {},
              displayItemFn: (dynamic item) => Text(
                (item ?? {})['name'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
              findFn: (dynamic str) async => _roles,
              selectedFn: (dynamic item1, dynamic item2) {
                if (item1 != null && item2 != null) {
                  return item1['name'] == item2['name'];
                }
                return false;
              },
              filterFn: (dynamic item, str) =>
                  item['name'].toLowerCase().indexOf(str.toLowerCase()) >= 0,
              dropdownItemFn: (dynamic item, int position, bool focused,
                      bool selected, Function() onTap) =>
                  ListTile(
                title: Text(item['name']),
                subtitle: Text(
                  item['desc'] ?? '',
                ),
                tileColor:
                    focused ? Color.fromARGB(20, 0, 0, 0) : Colors.transparent,
                onTap: onTap,
              ),
            ),
            Button('Submit', () async {
              CrowdedStreetRequestModel model = CrowdedStreetRequestModel(
                source: "6 kilo",
                destination: "megenagna",
              );
              //  listRoad = await APIService.getCrowdedStreet(model);
              // listRoadsController.

              listOfRoads.getListOfRoads(model);
              if (source == "" || destination == "") {
                Get.snackbar("error", "all fields should be filled",
                    backgroundColor: Colors.red[200],
                    duration: Duration(seconds: 3),
                    snackPosition: SnackPosition.TOP,
                    isDismissible: true,
                    snackStyle: SnackStyle.FLOATING);
              } else {
                // Get.to(DriverHome()),
                try {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });
                  //     await APIService
                  // .getCrowdedStreet(); //////////////////////have to send query ?????????????

                } catch (err) {
                  Get.snackbar(
                    "Network error", "try again",
                    // backgroundColor: Colors.redAccent[100],
                    duration: Duration(seconds: 5),
                    snackPosition: SnackPosition.TOP,
                  );
                }
              }
            }, Color.fromRGBO(72, 131, 246, 1)),
            SizedBox(
              height: 30,
            ),
            (listRoad==null)?Container():
            Expanded(child: StreetList(listRoad)),
          ],
        ),
      ),
    );
  }
}

class User {
  String name;
  String desc;
  int role;
  User(this.name, this.desc, this.role);
  factory User.fromJson(dynamic json) {
    return User(json['name'] as dynamic, json['desc'] as dynamic,
        json['role'] as dynamic);
  }
  @override
  String toString() {
    return '{ ${this.name},${this.desc}, ${this.role} }';
  }
}
