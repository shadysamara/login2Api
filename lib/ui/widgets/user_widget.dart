import 'package:flutter/material.dart';
import 'package:login_api/responses/all_users_response.dart';

class UserWidget extends StatelessWidget {
  User user;
  UserWidget(this.user);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      margin: EdgeInsets.all(5),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 30, backgroundImage: NetworkImage(user.picture)),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.title + '' + user.firstName + ' ' + user.lastName),
                Text(user.email),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
