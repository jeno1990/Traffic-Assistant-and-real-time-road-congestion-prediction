import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_traffic/models/login_request_model.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:mobile_traffic/screens/signup/components/background_for_signup.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:get/get.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:mobile_traffic/screens/signup/welcome.dart';
import 'package:mobile_traffic/services/api_service.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static final GlobalKey<FormState> globalFormKeyDriver =
      GlobalKey<FormState>();

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
                    key: globalFormKeyDriver,
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
                      //  Button("text", (){}, Colors.black),
                      Button('LogIn', () async {
                        LoginRequestModel model = LoginRequestModel(
                            email: emailController.text,
                            password: passwordController.text);

                        if (emailController.text == "" ||
                            passwordController.text == "") {
                          //this code will be changed to make the error report belo w the form field
                          Get.snackbar("error", "Both fields must be filled",
                              duration: Duration(seconds: 5),
                              snackPosition: SnackPosition.TOP);
                        } else {
                          try {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                              //    Timer(10000, callback)
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                });

                            //  await APIService.login(model);

// var url = Uri.parse('http://10.5.215.255/api/driver/driver_login');
// var response = await http.post(url, body: {'email': emailController.text, 'password': passwordController.text});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');

                            await APIService.login(model).then((response) {
                              setState(() {
                                // isApiCallProcess = false;
                              });
                              print('loged in');

                              if (response) {
                         
                                Get.toNamed('/driver_home');
                              } else {
                                Get.snackbar(
                                    "errors", "Invalid Username/password!!",
                                    duration: Duration(seconds: 10),
                                    snackPosition: SnackPosition.BOTTOM);
                              }
                            });
                          } catch (err) {
                            Get.snackbar("error",
                                "you are not connected to the internet",
                                duration: Duration(seconds: 5),
                                snackPosition: SnackPosition.TOP);
                          }
                        }
                        //Get.to(Violations())
                      }, Color.fromRGBO(72, 131, 246, 1)),
                      Button('Signup', () => {Get.to(Signup())},
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
