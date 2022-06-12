class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
   // this.id,
    this.old_password,
    this.new_password,
    
  });
  //late final String? id;
  late final String? old_password;
  late final String? new_password;
  

  ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) {
    old_password = json['old_password'];
    new_password = json['new_password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['old_password'] = old_password;
    _data['plate_number'] = new_password;
    return _data;
  }
}
