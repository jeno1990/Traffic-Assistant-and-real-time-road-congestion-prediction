import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mobile_traffic/screens/driver/driver_dashboard.dart';
import 'package:mobile_traffic/screens/driver/driver_home.dart';
import 'package:mobile_traffic/screens/driver/driver_notification.dart';
import 'package:mobile_traffic/screens/driver/driver_settings.dart';
import 'package:mobile_traffic/screens/signup/login.dart';
import 'package:mobile_traffic/screens/signup/signup.dart';
import 'package:mobile_traffic/screens/signup/welcome.dart';
import 'package:mobile_traffic/screens/traffic/report_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';

import 'controllers/driver_controller/dashboard_bindings.dart';

Widget _defaultHome =  Welcome();
//flutter run --no-sound-null-safety
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    bool isDriver=true;
  // Get result of the login function.
  bool _result = await SharedService.isLoggedIn();
  if (_result) {
    _defaultHome = _result? DriverDashBoard():Login();
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/' 
        , page: ()=>_defaultHome,
        
        
        ),
         GetPage(
          name: '/driver_login' 
        , page: ()=>Login(),
        
        
        ),
         GetPage(
          name: '/driver_register' 
        , page: ()=>Signup(),
        
        
        ),
        GetPage(
          name: '/driver_home' 
        , page: ()=>DriverDashBoard(),
        binding:DashBoardBindings()
        
        )

      ],
      //home: const LoginPage(),
      // routes: {
      //   '/': (context) => _defaultHome,
      //   '/driver_login': (context) => Login(),
      //   '/driver_register': (context) => Signup(),
        
      //   '/driver_home': (context) =>  DriverDashBoard(),
      //   '/driver/notification':(context)=>DriverNotification(),
      //   'driver/settings':(context)=>DriverSettings(),

      // },
    );
  }
}