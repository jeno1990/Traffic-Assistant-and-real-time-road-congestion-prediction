import 'dart:convert';

ChangePasswordResponseModel changePasswordJson(String str) =>
    ChangePasswordResponseModel.fromJson(json.decode(str));

class ChangePasswordResponseModel {
  ChangePasswordResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.old_password,
    required this.new_password
   
    //required this.id,
  });
  late final String old_password;
  late final String new_password;
  
 // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    old_password = json['old_password'];
    new_password = json['new_password'];
      
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['old_password'] = old_password;
    _data['new_password'] = new_password;
   
   // _data['id'] = id;
    return _data;
  }
}