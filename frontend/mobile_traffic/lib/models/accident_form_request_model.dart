class AccidentFormRequestModel {
  AccidentFormRequestModel({
   // this.id,
    this.accident_type,
    this.plate_number,
    
  });
  //late final String? id;
  late final String? accident_type;
  late final String? plate_number;
  

  AccidentFormRequestModel.fromJson(Map<String, dynamic> json) {
    accident_type = json['accident_type'];
    plate_number = json['plate_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['accident_type'] = accident_type;
    _data['plate_number'] = plate_number;
    return _data;
  }
}
