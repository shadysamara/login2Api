class PostResponse {
  Owner owner;
  String id;
  String image;
  String publishDate;
  String text;
  List<String> tags;
  String link;
  int likes;

  PostResponse(
      {this.owner,
      this.id,
      this.image,
      this.publishDate,
      this.text,
      this.tags,
      this.link,
      this.likes});

  PostResponse.fromJson(Map<String, dynamic> json) {
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    id = json['id'];
    image = json['image'];
    publishDate = json['publishDate'];
    text = json['text'];
    tags = json['tags'].cast<String>();
    link = json['link'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['id'] = this.id;
    data['image'] = this.image;
    data['publishDate'] = this.publishDate;
    data['text'] = this.text;
    data['tags'] = this.tags;
    data['link'] = this.link;
    data['likes'] = this.likes;
    return data;
  }
}

class Owner {
  String id;
  String email;
  String title;
  String picture;
  String firstName;
  String lastName;

  Owner(
      {this.id,
      this.email,
      this.title,
      this.picture,
      this.firstName,
      this.lastName});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    title = json['title'];
    picture = json['picture'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['title'] = this.title;
    data['picture'] = this.picture;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    return data;
  }
}
