import 'dart:convert';

// import 'package:flutter_login_register_nodejs/models/login_request_model.dart';
// import 'package:flutter_login_register_nodejs/models/login_response_model.dart';
// import 'package:flutter_login_register_nodejs/models/register_request_model.dart';
// import 'package:flutter_login_register_nodejs/models/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/models/accident_form_request_model.dart';
import 'package:mobile_traffic/models/accident_form_response_model.dart';
import 'package:mobile_traffic/models/change_password_request_model.dart';
import 'package:mobile_traffic/models/change_password_response_model.dart';
import 'package:mobile_traffic/models/crowded_street_requestModel.dart';
import 'package:mobile_traffic/models/crowded_street_responseModel.dart';
import 'package:mobile_traffic/models/login_request_model.dart';
import 'package:mobile_traffic/config.dart';
import 'package:mobile_traffic/models/login_response_model.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/models/signup_request_model.dart';
import 'package:mobile_traffic/models/signup_response_model.dart';
import 'package:mobile_traffic/models/traffic_report_request_model.dart';
import 'package:mobile_traffic/models/traffic_report_response_model.dart';
import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config.dart';

class APIService {
  static var client = http.Client();
  static final storage = new FlutterSecureStorage();

// static Future<bool> login( LoginRequestModel model) async {

// var url = Uri.parse('https://59fb-197-156-71-82.in.ngrok.io/api/driver/driver_login');
// var response = await http.post(url, body: {'email': model.email, 'password': model.password});
// print('Response status: ${response.statusCode}');
// print('Response body: ${response.body}');
// //  var response= await http.post(
// //     Uri.parse('https://59fb-197-156-71-82.in.ngrok.io/api/driver/driver_login'),
// //     headers: <String, String>{
// //       'Content-Type': 'application/json; charset=UTF-8',
// //     },
// //     body: jsonEncode(<String, LoginRequestModel>{
// //       'body': model,
// //     }),
// //   );
//  if (response.statusCode == 200) {
//       print(response.body);
//       await SharedService.setLoginDetails(
//         loginResponseJson(
//           response.body,
//         ),
//       );

//       return true;
//     } else {
//       return false;
//     }
//   }

  static Future<bool> login(
    LoginRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.DriverLoginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      Map<String, dynamic> output = json.decode(response.body);
      print(output['data']['token']);
      await storage.write(key: "token", value: output['data']['token']);

      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      print(response.body);

      return false;
    }
  }

  static Future<bool> login_traffic(
    LoginRequestModel model,
  ) async {
    print('login api');
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.TrafficLoginAPI,
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );

    if (response.statusCode == 200) {
      print(response.body);
      // print(response.body);
      Map<String, dynamic> output = json.decode(response.body);
      print(output['data']['token']);
      await storage.write(key: "token", value: output['data']['token']);
      await SharedService.setLoginDetails(
        loginResponseJson(
          response.body,
        ),
      );

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
    RegisterRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.DriverSignupAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 409) {
      return registerResponseJson(response.body);
    }
    print(response.body);
    return registerResponseJson(
      response.body,
    );
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();
    final String? token = await storage.read(key: 'token');
    String tokened = (token == null) ? "" : token;
    print(tokened);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'x-access-token': tokened,

      //  'Authorization': 'Basic ${loginDetails!.data.token}'
    };

    var url = Uri.http(Config.apiURL, Config.DriverHomeAPI);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "";
    }
  }

  static Future<List<NotificationModel>?> getNotification() async {
    final String? token = await storage.read(key: 'token');
    String tokened = (token == null) ? "" : token;
    print(tokened);
    var url = Uri.http(Config.apiURL, Config.trafficReportedCasesAPI);
    http.Response response = await client.get(url, headers: {
      "Content-Type": "application/json",
      'x-access-token': tokened,
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      print(response.body);

      return NotificationFromJson(response.body);

      //return true;
    } else {
      return null;
    }
  }

  static Future<List<CrowdedStreetResponseModel>?> getCrowdedStreet(
    CrowdedStreetRequestModel model,
  ) async {
    final String? token = await storage.read(key: 'token');
    final queryParameters = {
      'sp': model.source,
      'des': model.destination,
    };

    String tokened = (token == null) ? "" : token;
    print(tokened);
    var url =
        Uri.http(Config.apiURL, Config.listOfRoadsAPI, queryParameters);
    http.Response response = await client.get(url, headers: {
      "Content-Type": "application/json",
      'x-access-token': tokened,
      "Access-Control-Allow-Origin": "*"
    });
    if (response.statusCode == 200) {
      print(response.body);

      return crowdedStreetJson(response.body);

      //return true;
    } else {
      print(
          "kashfluhffiuhhjkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      return null;
    }
  }

  static Future<AccidentFormResponseModel> accident_form(
    AccidentFormRequestModel model,
  ) async {
    final String? token = await storage.read(key: 'token');
    String tokened = (token == null) ? "" : token;
    print(tokened);

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'x-access-token': tokened,
    };

    var url = Uri.http(Config.apiURL, Config.DriverAccidentFormAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    print(response.body);
    return accidentFormJson(
      response.body,
    );
  }

  static Future<TrafficReportResponseModel> traffic_report_form(
    TrafficReportRequestModel model,
  ) async {
    final String? token = await storage.read(key: 'token');
    String tokened = (token == null) ? "" : token;
    print(tokened);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'x-access-token': tokened,
    };

    var url = Uri.http(Config.apiURL, Config.trafficReportAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    //print(response.body);
    return trafficReportFormJson(
      response.body,
    );
  }

  static Future<ChangePasswordResponseModel> change_password(
    ChangePasswordRequestModel model,
  ) async {
    final String? token = await storage.read(key: 'token');
    String tokened = (token == null) ? "" : token;
    print(tokened);
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'x-access-token': tokened,
    };

    var url = Uri.http(Config.apiURL, Config.trafficReportAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    //print(response.body);
    return changePasswordJson(
      response.body,
    );
  }
}
