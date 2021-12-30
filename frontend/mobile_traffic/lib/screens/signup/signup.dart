import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Signup extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children : [ 
              Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset("assets/world_map.png",fit: BoxFit.fill,),
            ),
             Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                      Color.fromRGBO(72, 131, 246, 0.7),
                      Color.fromRGBO(0, 0, 0, 0.7)
                    ],
                        stops: [
                      0.0,
                      1.0
                    ])),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  child: ListView(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [                  // The validator receives the text that the user has entered.
                      // SizedBox(height: 30,),
                      // Container(padding: EdgeInsets.fromLTRB(20, 30, 0, 0),child: Text("sign up",style: TextStyle(fontSize: 36,color: Colors.white),)),
                     SizedBox(height: 20,),
                     Container(alignment: Alignment.center,child: HeaderText('Signup')),
                      SizedBox(height: 30,),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "First name",
                          labelStyle: TextStyle(color: Colors.white)),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Last name",
                          labelStyle: TextStyle(color: Colors.white)),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "confirm password",
                            labelStyle: TextStyle(color: Colors.white)),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40,),
                      Button('submit', (){}, Color.fromRGBO(0, 193, 31, 0.25)),
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
                          mini:true,
                      
                              ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]),
        ),
      ),
    );
  }
}