class PostCommentsResponse {
  List<Data> data;
  int total;
  int page;
  int limit;
  int offset;

  PostCommentsResponse(
      {this.data, this.total, this.page, this.limit, this.offset});

  PostCommentsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    total = json['total'];
    page = json['page'];
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['page'] = this.page;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class Data {
  Owner owner;
  String id;
  String message;
  String publishDate;

  Data({this.owner, this.id, this.message, this.publishDate});

  Data.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    id = json['id'];
    message = json['message'];
    publishDate = json['publishDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['id'] = this.id;
    data['message'] = this.message;
    data['publishDate'] = this.publishDate;
    return data;
  }
}

class Owner {
  String id;
  String title;
  String firstName;
  String lastName;
  String email;
  String picture;

  Owner(
      {this.id,
      this.title,
      this.firstName,
      this.lastName,
      this.email,
      this.picture});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    picture = json['picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['picture'] = this.picture;
    return data;
  }
}
