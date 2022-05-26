class CrowdedStreetRequestModel {
  CrowdedStreetRequestModel({
   // this.id,
    this.crowdedStreet,
    t
    
  });
  //late final String? id;
  late final String? crowdedStreet;
 
  

  CrowdedStreetRequestModel.fromJson(Map<String, dynamic> json) {
    crowdedStreet = json['crowdedStreet'];
   
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['crowdedStreet'] = crowdedStreet;
   
    return _data;
  }
}
