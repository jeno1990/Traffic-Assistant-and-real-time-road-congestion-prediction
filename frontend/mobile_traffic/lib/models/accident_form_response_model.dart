import 'dart:convert';

AccidentFormResponseModel accidentFormJson(String str) =>
    AccidentFormResponseModel.fromJson(json.decode(str));

class AccidentFormResponseModel {
  AccidentFormResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  AccidentFormResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.accident_type,
    required this.plate_number
   
    //required this.id,
  });
  late final String accident_type;
  late final String plate_number;
  
 // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    accident_type = json['accident_type'];
    plate_number = json['plate_number'];
      
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accident_type'] = accident_type;
    _data['plate_number'] = plate_number;
   
   // _data['id'] = id;
    return _data;
  }
}