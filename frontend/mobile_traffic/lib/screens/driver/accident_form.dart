import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobile_traffic/models/accident_form_request_model.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:get/get.dart';

class Accident_Form extends StatefulWidget {
  const Accident_Form({Key? key}) : super(key: key);

  @override
  _Accident_FormState createState() => _Accident_FormState();
}

class _Accident_FormState extends State<Accident_Form> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final accident_typeController = TextEditingController();
  final plate_numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Form(
            key: globalFormKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: accident_typeController,
                    decoration: InputDecoration(labelText: "Accident type"),
                  ),
                  TextFormField(
                    controller: plate_numberController,
                    decoration: InputDecoration(labelText: "Plate number"),
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: "Accident ocurance time"),
                  // ),
                  Button("submit", () async {
                    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                      print(position.longitude); //Output: 80.24599079
                      print(position.latitude); //Output: 29.6593457

String long = position.longitude.toString();
String lat = position.latitude.toString();
                    AccidentFormRequestModel model = AccidentFormRequestModel(
                        accident_type: accident_typeController.text,
                        plate_num: plate_numberController.text,
                        lat:lat,
                        lon:long,
                        driver_name:"yeshi"
                        );
                    await APIService.accident_form(model);
                    print('accident formm');      
                    Get.snackbar("Accident Form", "Your report is successfully submited",
                        duration: Duration(seconds: 10),
                        snackPosition: SnackPosition.BOTTOM);
                  }, Colors.blue)
                ],
              ),
            )),
      ),
    );
  }
}
