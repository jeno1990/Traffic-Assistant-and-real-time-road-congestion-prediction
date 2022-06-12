import 'dart:convert';

List<CrowdedStreetResponseModel> crowdedStreetJson(String str) =>
    List<CrowdedStreetResponseModel>.from(
        json.decode(str).map((x) => CrowdedStreetResponseModel.fromJson(x)));
//     List<Product> productFromJson(String str) =>
//     List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String NotificationToJson(List<CrowdedStreetResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CrowdedStreetResponseModel {
  CrowdedStreetResponseModel({
    //  this.id,
    this.crowdedStreet
  });
  // late String? id;
  late String? crowdedStreet;

  CrowdedStreetResponseModel.fromJson(Map<String, dynamic> json) {
    //  id = json['_id'];
    crowdedStreet = json['crowdedStreet'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['_id'] = id;
    _data['crowdedStreet'] = crowdedStreet;

    return _data;
  }
}

