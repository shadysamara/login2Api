import 'package:dio/dio.dart';
import 'package:login_api/responses/all_posts_response.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/responses/post_comments_response.dart';
import 'package:login_api/responses/post_response.dart';
import 'package:login_api/responses/user_response.dart';

class Api {
  Api._();
  static Api api = Api._();
  Dio dio = Dio();
  final String baseUrl = 'https://dummyapi.io/data/api/';
  Options options = Options(headers: {'app-id': '60bc7a9f92040a7c1a997c1b'});

  Future<AllUsersResponse> getAllUsers(int limit, int page) async {
    Response response = await dio.get(baseUrl + 'user',
        queryParameters: {'page': page, 'limit': limit}, options: options);
    return AllUsersResponse.fromJson(response.data);
  }

  Future<UserResponse> getUserById(String userId) async {
    Response response =
        await dio.get(baseUrl + 'user/$userId', options: options);
    return UserResponse.fromJson(response.data);
  }

  Future<AllPostsResponse> getAllPosts() async {
    Response response = await dio.get(baseUrl + 'post', options: options);
    return AllPostsResponse.fromJson(response.data);
  }

  Future<AllPostsResponse> getUserPosts(String userId) async {
    Response response =
        await dio.get(baseUrl + 'user/$userId/post', options: options);
    return AllPostsResponse.fromJson(response.data);
  }

  Future<PostResponse> getPostById(String postId) async {
    Response response =
        await dio.get(baseUrl + 'post/$postId', options: options);
    return PostResponse.fromJson(response.data);
  }

  Future<PostCommentsResponse> getPostComments(String postId) async {
    Response response =
        await dio.get(baseUrl + 'post/$postId/comment', options: options);
    return PostCommentsResponse.fromJson(response.data);
  }
}
