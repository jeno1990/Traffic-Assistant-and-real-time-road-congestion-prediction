import 'package:flutter/material.dart';
import 'package:mobile_traffic/screens/common_components/Button.dart';
import 'package:mobile_traffic/screens/common_components/header_text.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Container(
            decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/world_map.png',
            ),
          ),
        )),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
          Positioned(
            left: 15,
            top: 25,
            child: HeaderText('Welcome Back'),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                TextFormField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Button('LogIn', () {}, Color.fromRGBO(72, 131, 246, 1)),
                Button('SignIn', () {}, Color.fromRGBO(0, 193, 31, 0.25)),
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
                TextButton(
                  onPressed: (){}, 
                  style: TextButton.styleFrom(
                    textStyle:TextStyle( fontSize: 15,color:Colors.white)
                  ),
                  child: Text('Forgot password ?'))
              ],
            )),
          )
        ])
      ])),
    );
  }
}
