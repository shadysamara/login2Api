class UserResponse {
  String id;
  String phone;
  String lastName;
  String firstName;
  String email;
  String title;
  Location location;
  String gender;
  String registerDate;
  String picture;
  String dateOfBirth;

  UserResponse(
      {this.id,
      this.phone,
      this.lastName,
      this.firstName,
      this.location,
      this.email,
      this.gender,
      this.title,
      this.registerDate,
      this.picture,
      this.dateOfBirth});

  UserResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    lastName = json['lastName'];
    firstName = json['firstName'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    email = json['email'];
    gender = json['gender'];
    title = json['title'];
    registerDate = json['registerDate'];
    picture = json['picture'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone'] = this.phone;
    data['lastName'] = this.lastName;
    data['firstName'] = this.firstName;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['title'] = this.title;
    data['registerDate'] = this.registerDate;
    data['picture'] = this.picture;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}

class Location {
  String state;
  String street;
  String city;
  String timezone;
  String country;

  Location({this.state, this.street, this.city, this.timezone, this.country});

  Location.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    street = json['street'];
    city = json['city'];
    timezone = json['timezone'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['street'] = this.street;
    data['city'] = this.city;
    data['timezone'] = this.timezone;
    data['country'] = this.country;
    return data;
  }
}
