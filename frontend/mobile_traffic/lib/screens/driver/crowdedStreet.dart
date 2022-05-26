import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:get/get.dart';

class CrowdedStreet extends StatefulWidget {
  const CrowdedStreet({Key? key}) : super(key: key);

  @override
  _CrowdedStreetState createState() => _CrowdedStreetState();
}

class _CrowdedStreetState extends State<CrowdedStreet> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final crowdedStreetController = TextEditingController();
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
                    controller: crowdedStreetController,
                    decoration: InputDecoration(labelText: "which road is crowded?"),
                  ),
                 
                 
                  Button("submit", () async {
                    CrowdedStreetRequestModel model = CrowdedStreetRequestModel(
                        crowdedStreet: crowdedStreetController.text,
                    );
                    await APIService.crowdedStreet(model);
                    print('crowded street');
                    Get.snackbar("crowded street", "Your report is successfully submited",
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
