import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/models/traffic_report_request_model.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
//import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:mobile_traffic/screens/traffic/components/bottom_navigation.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/services/api_service.dart';
class Report_form extends StatefulWidget {
  const Report_form({ Key? key }) : super(key: key);

  @override
  State<Report_form> createState() => _Report_formState();
}

class _Report_formState extends State<Report_form> {
  
  final violation_typeController = TextEditingController();
  final plate_numberController = TextEditingController(); 
  final driver_nameController = TextEditingController();
  final commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  ListView(
                  children: [
                    
                    Text(
                      'Report Form',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Roboto", fontSize: 16),
                    ),
                      
                    Container(
                    padding: EdgeInsets.all(20),
                    child: Form(
                  //  key: formKey,
                    child: Column(children: [
                      TextFormField(
                        controller: plate_numberController,
                        decoration: InputDecoration(
                          labelText: "Plate number",
                        ),
                      ),
                       TextFormField(
                         controller: violation_typeController,
                        decoration: InputDecoration(
                          labelText: "Violation type",
                        ),
                      ),
                      TextFormField(
                        controller: driver_nameController,
                        decoration: InputDecoration(
                          labelText: "Driver Name",
                        ),
                      ),
                      TextFormField(
                        controller: commentController,
                        decoration:InputDecoration(
                          labelText: "Write a Comment ..."
                        ),
                        minLines:1,
                        maxLines:5,
                        keyboardType: TextInputType.multiline,
                      ),
                      Button("Submit", ()async{
                        TrafficReportRequestModel model = TrafficReportRequestModel(
                        violation_type: violation_typeController.text,
                        plate_number: plate_numberController.text,
                        driver_name: driver_nameController.text,
                        comment: commentController.text
                        
                        );
                    await APIService.traffic_report_form(model);
                    print('Traffic Report formm');
                    Get.snackbar("Accident Form", "Your report is successfully submited",
                        duration: Duration(seconds: 10),
                        snackPosition: SnackPosition.BOTTOM);
                      }, Color.fromRGBO(72, 131, 246, 1))
                    ])),
                    ),
                  
             
   ]
    
 ); }}

