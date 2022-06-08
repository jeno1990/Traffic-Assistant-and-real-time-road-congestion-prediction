class CrowdedStreetRequestModel {
  CrowdedStreetRequestModel({
    this.source,
    this.destination,
  });
  late final String? source;
  late final String? destination;

  CrowdedStreetRequestModel.fromJson(Map<String, dynamic> json) {
    source = json['source'];
    destination = json['destination'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['source'] = source;
    _data['destination'] = destination;
    return _data;
  }
}
