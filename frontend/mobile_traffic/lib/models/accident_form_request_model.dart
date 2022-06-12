class AccidentFormRequestModel {
  AccidentFormRequestModel({
   // this.id,
    this.accident_type,
    this.plate_num,
    this.lat,
    this.lon,
    this.driver_name,
    
  });
  //late final String? id;
  late final String? accident_type;
  late final String? plate_num;
  late final String? lat;
  late final String? lon;
  late final String? driver_name;
  // late final String? plate_num;
  

  AccidentFormRequestModel.fromJson(Map<String, dynamic> json) {
    accident_type = json['accident_type'];
    plate_num = json['plate_num'];
    lat = json['lat'];
    lon = json['lon'];
    driver_name = json['driver_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accident_type'] = accident_type;
    _data['plate_num'] = plate_num;
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['driver_name'] = driver_name;
    return _data;
  }
}
