import 'package:flutter/material.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/services/api_provider.dart';
import 'package:login_api/ui/pages/user_details.dart';
import 'package:login_api/ui/widgets/user_widget.dart';
import 'package:provider/provider.dart';

class AllUsersPage extends StatelessWidget {
  static String routeName = 'usersPage';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('All Users'),
      ),
      body:
          // FutureBuilder<AllUsersResponse>(
          //   future: Api.api.getAllUsers(),
          //   builder: (context, snapshot) {
          //     AllUsersResponse response = snapshot.data;
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     } else if (response.data.isEmpty) {
          //       return Center(
          //         child: Text('No Users Found'),
          //       );
          //     } else {
          //       return ListView.builder(
          //           itemCount: response.data.length,
          //           itemBuilder: (context, index) {
          //             return UserWidget(response.data[index]);
          //           });
          //     }
          //   },
          // )

          Selector<ApiProvider, AllUsersResponse>(
        builder: (context, response, widget) {
          if (response == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (response.data.isEmpty) {
            return Center(
              child: Text('No Users Found'),
            );
          } else {
            return ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Provider.of<ApiProvider>(context, listen: false)
                            .getUserById(response.data[index].id);
                        Navigator.pushNamed(context, UserDetailsPage.routeName,
                            arguments: response.data[index]);
                      },
                      child: UserWidget(response.data[index]));
                });
          }
        },
        selector: (context, provider) {
          return provider.allUsersResponse;
        },
      ),
    );
  }
}
