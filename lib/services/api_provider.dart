import 'package:flutter/material.dart';
import 'package:login_api/responses/all_posts_response.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/responses/post_comments_response.dart';
import 'package:login_api/responses/post_response.dart';
import 'package:login_api/responses/user_response.dart';
import 'package:login_api/services/api.dart';

class ApiProvider extends ChangeNotifier {
  AllUsersResponse allUsersResponse;
  List<User> users = [];
  UserResponse userResponse;
  AllPostsResponse allPostsResponse;
  PostResponse postResponse;
  PostCommentsResponse postCommentsResponse;

  getAllUsers() async {
    try {
      allUsersResponse = await Api.api.getAllUsers();

      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }

  getUserById(String userId) async {
    try {
      userResponse = null;
      userResponse = await Api.api.getUserById(userId);
      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }

  getUserPosts(String userId) async {
    try {
      allPostsResponse = await Api.api.getUserPosts(userId);
      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }

  getPostDetails(String postId) async {
    try {
      postResponse = await Api.api.getPostById(postId);
      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }

  getPostComments(String postId) async {
    try {
      postCommentsResponse = await Api.api.getPostComments(postId);
      notifyListeners();
    } on Exception catch (e) {
      // TODO
    }
  }
}
