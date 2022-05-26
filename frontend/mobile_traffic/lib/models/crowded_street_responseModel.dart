import 'dart:convert';

CrowdedStreetResponseModel crowdedStreetJson(String str) =>
    CrowdedStreetResponseModel.fromJson(json.decode(str));

class CrowdedStreetResponseModel {
  CrowdedStreetResponseModel({
    required this.message,
    required this.data,
  });
  late final String message;
  late final Data? data;

  CrowdedStreetResponseModel.fromJson(Map<String, dynamic> json) {
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
    required this.crowdedStreet,
    
   
    //required this.id,
  });
  late final String crowdedStreet;
  
 // late final String id;

  Data.fromJson(Map<String, dynamic> json) {
    crowdedStreet = json['crowdedStreet'];
      
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['crowdedStreet'] = crowdedStreet;
   
   // _data['id'] = id;
    return _data;
  }
}