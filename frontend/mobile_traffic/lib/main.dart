import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_traffic/screens/driver/driver_home.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:mobile_traffic/screens/signup/welcome.dart';
import 'package:mobile_traffic/screens/traffic/report_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';

Widget _defaultHome =  Welcome();
//flutter run --no-sound-null-safety
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    bool isDriver=true;
  // Get result of the login function.
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = isDriver? DriverHome():Report_form();
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const LoginPage(),
      routes: {
        '/': (context) => _defaultHome,
        '/driver_home': (context) =>  DriverHome(),
        '/driver_login': (context) => Login(),
        '/driver_register': (context) => Signup(),
      },
    );
  }
}