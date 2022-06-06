import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
// import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';

class Violations extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  ListView.builder(
      padding: EdgeInsets.only(top: 0),
      // physics: NeverScrollableScrollPhysics(),
      itemCount: 15,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          // shape: ShapeBorder(),
          tileColor: Colors.white,
          leading: CircleAvatar(
            child: Icon(Icons.car_repair), //Text("${index+1}"),
          ),
          title: Text("Speed alert"),
          subtitle: Text("A06752 AA"),
        ),
      ),
    );
  }
}
