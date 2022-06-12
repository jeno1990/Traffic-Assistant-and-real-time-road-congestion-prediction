import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/login_request_model.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/signup/components/background_for_signup.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:get/get.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mobile_traffic/screens/signup/welcome.dart';
import 'package:mobile_traffic/screens/traffic/traffic_dashboard.dart';
import 'package:mobile_traffic/screens/traffic/violations.dart';
import 'package:mobile_traffic/services/api_service.dart';

class LoginAsTraffic extends StatefulWidget {
  @override
  State<LoginAsTraffic> createState() => _LoginAsTrafficState();
}

class _LoginAsTrafficState extends State<LoginAsTraffic> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        BackgroundSignUp(),
        ListView(children: [
          Row(
            children: [
              IconButton(
                  onPressed: () => {Get.to(Welcome())},
                  icon: Icon(Icons.arrow_back)),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 40),
                child: Positioned(
                  left: 15,
                  top: 87,
                  child: Center(child: HeaderText('Welcome Back')),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
              padding: EdgeInsets.all(20),
              child: Form(
                  key: globalFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Email",
                              labelStyle: TextStyle(color: Colors.white)),
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          }),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              //true is place holder we will do value.isEmpty
                              return 'Please enter password';
                            }
                            return null;
                          }),
                      Button('LogIn', () async {
                        LoginRequestModel model = LoginRequestModel(
                            email: emailController.text,
                            password: passwordController.text);
                          if(emailController.text==""||passwordController.text==""){
                           //this code will be changed to make the error report belo w the form field
                            Get.snackbar( 
                                "error", "Both fields must be filled",
                                duration: Duration(seconds: 5),
                                snackPosition: SnackPosition.TOP);
                          }else{
                            try{
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(child: CircularProgressIndicator(),);
                                });
                            //await APIService.login_traffic(model);
                            print('loged in');
                           await APIService.login_traffic(model).then((response) {
                              setState(() {
                                // isApiCallProcess = false;
                              });
                            
                            if (response) {
                              Get.to(TrafficDashBoard());
                            } else {
                              Get.snackbar(
                                  "errors", "Invalid Username/password!!",
                                  duration: Duration(seconds: 10),
                                  snackPosition: SnackPosition.BOTTOM);
                            }
                          });
                            }catch(err){
                               Get.snackbar( 
                                "error", "you are not connected to the internet",
                                duration: Duration(seconds: 5),
                                snackPosition: SnackPosition.TOP);
                            }
                          }
                        //Get.to(Violations())
                      }, Color.fromRGBO(72, 131, 246, 1)),
                      
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          child: Text('Forgot password ?',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white))),
                    ],
                  )))
        ])
      ])),
    );
  }
}
