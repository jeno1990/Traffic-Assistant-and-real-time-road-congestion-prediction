import 'dart:convert';

List<NotificationModel> NotificationFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));
//     List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String NotificationToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel {
  NotificationModel({
    //  this.id,
    this.accident_type,
    this.plate_number,
  });
  // late String? id;
  late String? accident_type;
  late String? plate_number;

  NotificationModel.fromJson(Map<String, dynamic> json) {
    //  id = json['_id'];
    accident_type = json['accident_type'];
    plate_number = json['plate_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['_id'] = id;
    _data['accident_type'] = accident_type;
    _data['plate_number'] = plate_number;

    return _data;
  }
}
