import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';

class DriverTool extends StatefulWidget {
  // const DriverTool({ Key? key }) : super(key: key);

  @override
  _DriverToolState createState() => _DriverToolState();
}

class _DriverToolState extends State<DriverTool> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          // backgroundColor: Colors.blue,
          body: Container(
              width: size.width,
              height: size.height,
              color: Colors.blue,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.all(20),
                        child: HeaderText("Driver")),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: size.width,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TabBar(
                          tabs: [
                            Tab(
                              text: 'NearBy Hotels',
                            ),
                            Tab(
                              text: 'NearBy Garage',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: size.width,

                          // color: Colors.white,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Container(
                            padding: EdgeInsets.all(20),
                            child: TabBarView(children: [
                              NearByHotel(),
                              NearByGomista()              ]),
                          )),
                    ),
                  ])),
          // bottomNavigationBar: BottomNavigation(),
        ),
      ),
    );
  }

  Widget TabText(String text, bool isSelected, int index) {
    return GestureDetector(
        onTap: () {},
        child: Text(text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.white60,
            )));
  }

  Widget NearByGomista() {
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
            child: Icon(Icons.car_repair), //Text("${index+1}"),
          ),
          title: Text("Fetan Gomista"),
          subtitle: Text("195m away"),
        ),
      ),
    );
  }

  Widget NearByHotel() {
    return GridView.builder(
                itemCount: 15,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemBuilder: (context, index) {
                  
                  return  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: GridTile(
                          child: GestureDetector(
                            onTap: (){
                            },
                            child: Container(
                                child:
                                    Image.asset("assets/sharaton.jpg")),
                          ),
                          footer: GridTileBar(
                            backgroundColor: Color.fromRGBO(0, 0, 0, 0.65),
                            leading: Text(
                              "Sharaton Addis",
                              style: TextStyle(color: Colors.white),
                            ),
                            
                            
                                
                            ),
                          ));
                    
                  
                });
          }
  }

