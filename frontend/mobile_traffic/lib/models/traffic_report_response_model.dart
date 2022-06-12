import 'dart:convert';

TrafficReportResponseModel trafficReportFormJson(String str) =>
    TrafficReportResponseModel.fromJson(json.decode(str));

class TrafficReportResponseModel {
  TrafficReportResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  TrafficReportResponseModel.fromJson(Map<String, dynamic> json) {
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
  Data(
      {required this.violation_type,
      required this.plate_number,
      required this.driver_name,
      required this.comment

      //required this.id,
      });
  late final String violation_type;
  late final String plate_number;
  late final String driver_name;
  late final String comment;

  // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    violation_type = json['violation_type'];
    plate_number = json['plate_number'];
    driver_name = json['driver_name'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['violation_type'] = violation_type;
    _data['plate_number'] = plate_number;
    _data['driver_name'] = driver_name;
    _data['comment'] = comment;

    // _data['id'] = id;
    return _data;
  }
}
