class RegisterRequestModel {
  RegisterRequestModel({
    this.first_name,
    this.last_name,
    this.phone_number,
    this.address,
    this.email,
    this.password,
  });
  late final String? first_name;
  late final String? last_name;
  late final String? phone_number;
  late final String? address;
  late final String? password;
  late final String? email;

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    phone_number = json["phone_number"];
    address = json["address"];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = first_name;
    _data['last_name'] = last_name;

    _data['phone_number'] = phone_number;
    _data['address'] = address;

    _data['email'] = email;
    _data['password'] = password;

    return _data;
  }
}
