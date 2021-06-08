class RegisterResponse {
  int code;
  bool status;
  String message;
  User user;
  String accessToken;

  RegisterResponse(
      {this.code, this.status, this.message, this.user, this.accessToken});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['accessToken'] = this.accessToken;
    return data;
  }
}

class User {
  int id;
  String name;
  String email;
  String mobile;
  Null emailVerifiedAt;
  Null deletedAt;
  String status;
  String type;
  String image;
  Null address;
  Null locationLong;
  Null locationLat;
  Null cityId;
  Null areaId;
  String countryId;
  Null currency;
  String showOnMap;
  String resellerCategory;
  String fcmToken;
  Null facebookToken;
  Null googleToken;
  Null appleToken;
  String mobileVerifyCode;
  String balance;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.emailVerifiedAt,
      this.deletedAt,
      this.status,
      this.type,
      this.image,
      this.address,
      this.locationLong,
      this.locationLat,
      this.cityId,
      this.areaId,
      this.countryId,
      this.currency,
      this.showOnMap,
      this.resellerCategory,
      this.fcmToken,
      this.facebookToken,
      this.googleToken,
      this.appleToken,
      this.mobileVerifyCode,
      this.balance});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    emailVerifiedAt = json['email_verified_at'];
    deletedAt = json['deleted_at'];
    status = json['status'];
    type = json['type'];
    image = json['image'];
    address = json['address'];
    locationLong = json['location_long'];
    locationLat = json['location_lat'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    countryId = json['country_id'];
    currency = json['currency'];
    showOnMap = json['show_on_map'];
    resellerCategory = json['reseller_category'];
    fcmToken = json['fcm_token'];
    facebookToken = json['facebook_token'];
    googleToken = json['google_token'];
    appleToken = json['apple_token'];
    mobileVerifyCode = json['mobile_verify_code'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['deleted_at'] = this.deletedAt;
    data['status'] = this.status;
    data['type'] = this.type;
    data['image'] = this.image;
    data['address'] = this.address;
    data['location_long'] = this.locationLong;
    data['location_lat'] = this.locationLat;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['country_id'] = this.countryId;
    data['currency'] = this.currency;
    data['show_on_map'] = this.showOnMap;
    data['reseller_category'] = this.resellerCategory;
    data['fcm_token'] = this.fcmToken;
    data['facebook_token'] = this.facebookToken;
    data['google_token'] = this.googleToken;
    data['apple_token'] = this.appleToken;
    data['mobile_verify_code'] = this.mobileVerifyCode;
    data['balance'] = this.balance;
    return data;
  }
}
