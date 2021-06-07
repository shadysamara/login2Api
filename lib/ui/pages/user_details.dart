import 'package:flutter/material.dart';
import 'package:login_api/api_provider.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/responses/user_response.dart';
import 'package:provider/provider.dart';

class UserDetailsPage extends StatelessWidget {
  static String routeName = 'userDetails';
  User user;
  UserDetailsPage([this.user]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Selector<ApiProvider, UserResponse>(
        builder: (context, userDetails, widget) {
      return Scaffold(
          appBar: AppBar(title: Text(user.firstName + ' ' + user.lastName)),
          body: GestureDetector(
            onTap: () {
              Provider.of<ApiProvider>(context, listen: false)
                  .getUserPosts(user.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            user.picture,
                          ),
                          fit: BoxFit.contain),
                      shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  user.title + '' + user.firstName + ' ' + user.lastName,
                  textAlign: TextAlign.center,
                ),
                Text(
                  user.email,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Location: ',
                      textAlign: TextAlign.center,
                    ),
                    Center(
                      child: Container(
                        child: Text(
                          userDetails == null
                              ? 'Fetching Location ...'
                              : userDetails.location.country,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    }, selector: (context, provider) {
      return provider.userResponse;
    });
  }
}
