import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';

class GustHome extends StatefulWidget {
  // const DriverTool({ Key? key }) : super(key: key);

  @override
  _GustHomeState createState() => _GustHomeState();
}

class _GustHomeState extends State<GustHome> {
  final formKey = new GlobalKey<FormState>();

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
                              text: 'Report Issue',
                            ),
                            Tab(
                              text: 'To see Tariff',
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
                            child: TabBarView(
                                children: [ReportIssue(), SeeTariff()]),
                          )),
                    ),
                  ])),
        //  bottomNavigationBar: BottomNavigation(),
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

  Widget ReportIssue() {
    return Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: formKey,
            child: Column(children: [
              Container(
                child: Text('To report violation of rule'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "what kind of violation you see",
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Plate number",
                ),
              ),
              Button("Submit", () {}, Color.fromRGBO(72, 131, 246, 1))
            ])));
  }

  Widget SeeTariff() {
    return Container();
  }
}
