import 'dart:convert';

// import 'package:flutter_login_register_nodejs/models/login_request_model.dart';
// import 'package:flutter_login_register_nodejs/models/login_response_model.dart';
// import 'package:flutter_login_register_nodejs/models/register_request_model.dart';
// import 'package:flutter_login_register_nodejs/models/register_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_traffic/controllers/driver_controller/driver_notificationController.dart';
import 'package:mobile_traffic/models/accident_form_request_model.dart';
import 'package:mobile_traffic/models/accident_form_response_model.dart';
import 'package:mobile_traffic/models/login_request_model.dart';
import 'package:mobile_traffic/config.dart';
import 'package:mobile_traffic/models/login_response_model.dart';
import 'package:mobile_traffic/models/notification_model.dart';
import 'package:mobile_traffic/models/signup_request_model.dart';
import 'package:mobile_traffic/models/signup_response_model.dart';
import 'package:mobile_traffic/screens/driver/accident_form.dart';
import 'package:mobile_traffic/services/shared_services.dart';

import '../../config.dart';

class APIService {
  static var client = http.Client();

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

    if (response.statusCode == 200) {
      print(response.body);
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
    //print(response.body);
    return registerResponseJson(
      response.body,
    );
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
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
    var url = Uri.http(Config.apiURL, Config.trafficReportedAPI);
    http.Response response = await client.get(url, headers: {
      "Content-Type": "application/json",
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

  static Future<AccidentFormResponseModel> accident_form(
    AccidentFormRequestModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Config.apiURL, Config.DriverAccidentFormAPI);

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(model.toJson()),
    );
    //print(response.body);
    return accidentFormJson(
      response.body,
    );
  }
}
