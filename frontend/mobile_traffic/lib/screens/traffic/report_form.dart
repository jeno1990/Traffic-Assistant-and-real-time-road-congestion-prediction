import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';

class Report_form extends StatefulWidget {
  @override
  State<Report_form> createState() => _Report_formState();
}

class _Report_formState extends State<Report_form> {
  String _violation;
  bool _isActive=true;
  String _actionTaken;
  String _actionTakenResult;

  String _violationResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _violation = '';
    _violationResult = '';
    _actionTaken = "";
    _actionTakenResult = "";
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _actionTakenResult = _actionTaken;
        _violationResult = _violation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
     // Traffc_background("Report Form"),
       Container(
                          color: Colors.blue,

         width: double.infinity,
         child: Row(

           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Expanded(
               child: Container(
                 padding:EdgeInsets.only(bottom: 10),
                          height: MediaQuery.of(context).size.height*0.2,
                          decoration: BoxDecoration(
                          ),
                          width: double.infinity,
                          child: Container(padding: EdgeInsets.fromLTRB(30, 30, 0, 10) ,child: HeaderText("Report Form")),
                        ),
             ),
                      IconButton(
                        onPressed: (){
                        
                                        setState(() {
                      if(_isActive==true){
                        _isActive=false;
                      }else{
                        _isActive=true;
                      }
                                        });
                                      },
                                      icon: Icon(_isActive?Icons.visibility:Icons.visibility_off)),
           ],
         ),
       ),
      Expanded(
        child: Container(
          color: Colors.blue,
          child: Container(
             decoration: BoxDecoration(
                 color:Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40)
                ),
             ),
           padding: EdgeInsets.only(top:10),
            child: ScrollConfiguration(
              behavior:ScrollBehavior() ,
              child: SingleChildScrollView(
                physics: new ClampingScrollPhysics(),
                child: Column(
                  children: [
                    
                    Text(
                      'Report Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Roboto", fontSize: 16),
                    ),
                      
                    Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                    key: formKey,
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Plate number",
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5),
                       decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                          child: DropDownFormField(
                            
                            titleText: 'Violation type',
                            value: _violation,
                            onSaved: (value) {
                              setState(() {
                                _violation = value;
                              });
                            },
                            onChanged: (value) {
                              setState(() {
                                _violation = value;
                              });
                            },
                            dataSource: [
                              {
                                "display": "Over Speed",
                                "value": "Over Speed",
                              },
                              {
                                "display": "With out driving licence",
                                "value": "With out driving licence",
                              },
                              {
                                "display": "Ilegal driving",
                                "value": "Ilegal driving",
                              },
                              {
                                "display": "Over Specified Triff",
                                "value": "Over Specified Tariff",
                              },
                              {
                                "display": "Vehicle is not ready for driving",
                                "value": "Vehicle is not ready for driving",
                              },
                            ],
                            textField: 'display',
                            valueField: 'value',
                          ),
                        ),
                      
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        child: DropDownFormField(
                          titleText: 'Action Taken',
                          value: _actionTaken,
                          onSaved: (value) {
                            setState(() {
                              _actionTaken = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              _actionTaken = value;
                            });
                          },
                          dataSource: [
                            {
                              "display": "Suspend Driving Licence",
                              "value": "Suspend Driving Licence",
                            },
                            {
                              "display": "Removing Vehicle plate",
                              "value": "Removing Vehicle plate",
                            },
                            {
                              "display": "Removing Vehicle Bollo",
                              "value": "Removing Vehicle Bollo",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Driver Name",
                        ),
                      ),
                      TextFormField(
                        decoration:InputDecoration(
                          labelText: "Write a Comment ..."
                        ),
                        minLines:1,
                        maxLines:5,
                        keyboardType: TextInputType.multiline,
                      ),
                      Button("Submit", (){}, Color.fromRGBO(72, 131, 246, 1))
                    ])),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]),
    bottomNavigationBar: BottomNavigation(),
    ));
  }
}
