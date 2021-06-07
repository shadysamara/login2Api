import 'package:flutter/material.dart';
import 'package:login_api/api.dart';
import 'package:login_api/responses/all_posts_response.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/responses/post_comments_response.dart';
import 'package:login_api/responses/post_response.dart';
import 'package:login_api/responses/user_response.dart';

class ApiProvider extends ChangeNotifier {
  AllUsersResponse allUsersResponse;
  UserResponse userResponse;
  AllPostsResponse allPostsResponse;
  PostResponse postResponse;
  PostCommentsResponse postCommentsResponse;
  int page = 0;
  int limit = 10;
  getAllUsers() async {
    try {
      if (allUsersResponse.total > page * limit) {
        allUsersResponse = await Api.api.getAllUsers(page, limit);
        page++;
        notifyListeners();
      }
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
