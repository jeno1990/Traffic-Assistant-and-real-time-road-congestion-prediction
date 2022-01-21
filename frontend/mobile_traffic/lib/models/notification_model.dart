List<NotificationModel> NotificationFromJson(dynamic str) =>
    List<NotificationModel>.from((str).map((x) => NotificationModel.fromJson(x)));

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