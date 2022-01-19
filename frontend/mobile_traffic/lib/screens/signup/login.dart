import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/login_request_model.dart';
import 'package:mobile_traffic/screens/driver/driver_home.dart';
import 'package:mobile_traffic/screens/driver/driver_tool.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/signup/components/background_for_signup.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:get/get.dart';

import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mobile_traffic/screens/traffic/report_form.dart';
import 'package:mobile_traffic/screens/traffic/violations.dart';
import 'package:mobile_traffic/services/api_service.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        BackgroundSignUp(),
        ListView(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 40),
              child: Positioned(
                left: 15,
                top: 87,
                child: HeaderText('Welcome Back'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: Form(
                    key: globalFormKey,
                    child: Column(children: [
                      TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: "email",
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
                        await APIService.login(model);
                        print('login');
                        APIService.login(model).then((response) {
                          setState(() {
                            // isApiCallProcess = false;
                          });

                          if (response) {
                            Get.to(DriverHome());
                          } else {
                            Get.snackbar(
                                "errors", "Invalid Username/password!!",
                                duration: Duration(seconds: 10) ,
                                snackPosition: SnackPosition.BOTTOM);
                          }
                        });
                        //Get.to(Violations())
                      }, Color.fromRGBO(72, 131, 246, 1)),
                      Button('SignIn', () => {Get.to(Signup())},
                          Color.fromRGBO(0, 193, 31, 0.25)),
                    ]))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Image.asset('assets/google_logo.png',
                        height: 31, width: 31),
                  ),
                ),
                SignInButton(
                  Buttons.Facebook,
                  onPressed: () {},
                  mini: true,
                ),
              ],
            ),
            TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white)),
                child: Text('Forgot password ?',
                    style: TextStyle(fontSize: 15, color: Colors.white))),
          ],
        )
      ])),
    );
  }
}
