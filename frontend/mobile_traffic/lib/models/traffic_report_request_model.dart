class TrafficReportRequestModel {
  TrafficReportRequestModel(
      {
      // this.id,
      this.violation_type,
      this.plate_number,
      this.driver_name,
      this.comment});
  //late final String? id;
  late final String? violation_type;
  late final String? plate_number;
  late final String? driver_name;
  late final String? comment;

  TrafficReportRequestModel.fromJson(Map<String, dynamic> json) {
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
    return _data;
  }
}
