import 'package:login_api/responses/post_response.dart';

class AllPostsResponse {
  List<PostResponse> data;
  int total;
  int page;
  int limit;
  int offset;

  AllPostsResponse({this.data, this.total, this.page, this.limit, this.offset});

  AllPostsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<PostResponse>();
      json['data'].forEach((v) {
        data.add(new PostResponse.fromJson(v));
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
