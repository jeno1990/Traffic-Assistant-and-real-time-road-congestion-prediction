import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_traffic/models/change_password_request_model.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/services/api_service.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
   final old_passwordController = TextEditingController();
  final new_passwordController = TextEditingController(); 
  final confirm_passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
        ),
        body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(children: [
              TextFormField(
                controller: old_passwordController,
                decoration: InputDecoration(labelText: "Old Password"),
              ),
              TextFormField(
                controller: new_passwordController,
                decoration: InputDecoration(labelText: "New Password"),
              ),
              TextFormField(
                controller: confirm_passwordController,
                decoration: InputDecoration(labelText: "Confirm Password"),
              ),
              // TextFormField(
              //   decoration: InputDecoration(labelText: "Accident ocurance time"),
              // ),
              Button("submit", () async {
                ChangePasswordRequestModel model = ChangePasswordRequestModel(
                    old_password: old_passwordController.text,
                    new_password: new_passwordController.text);
                await APIService.change_password(model);
                print('accident formm');
                Get.snackbar(
                    "Accident Form", "Your report is successfully submited",
                    duration: Duration(seconds: 10),
                    snackPosition: SnackPosition.BOTTOM);
              }, Colors.blue)
            ])));
  }
}
