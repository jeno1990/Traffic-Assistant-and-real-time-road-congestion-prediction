import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
// import 'package:mobile_traffic/screens/common_components/traffic_background.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';

class Violations extends StatelessWidget {
  // const Violations({ Key? key }) : super(key: key);
  bool isActive= true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: Colors.blue,
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.blue,
          child: Stack(
            children:[ 
              Positioned(
                top: 30,
                left: 50,
                child: HeaderText("Violations")),
              Positioned(
                    top: 10,
                    right: 20,
                    child: IconButton(onPressed: (){},
                    icon: Icon(isActive?Icons.visibility:Icons.visibility_off))),
              Positioned(
                  top: 70,
                  child:  Container(
                    width: size.width,
                    
                    child: TabBar(
                      tabs: [
                       Tab(text: 'Violations',),
                       Tab(text: 'Violations',),
                       Tab(text: 'Violations',),
                      ],
                    ),
                  ),
                  ),
              Positioned(
                top: 110,
                child: Container(
                  width: size.width,
                  height: 555,
                  // color: Colors.white,
                  decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(40)),
                  
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: TabBarView(children: [
                      list(),
                      list(),
                      list(),
                    ]),
                  )
                ),
              )
                
              ])),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
  Widget TabText (String text, bool isSelected, int index){
    return GestureDetector( onTap:(){} , child: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: isSelected?Colors.white:Colors.white60,)));
  }
  Widget list(){
    return ListView.builder(
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
                              child: Icon(Icons.car_repair),//Text("${index+1}"),
                            ),
                            title: Text("Speed alert"),
                            subtitle: Text("A06752 AA"),
                          ),
                        ),
                      );
  }
}