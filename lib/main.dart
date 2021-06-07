import 'package:flutter/material.dart';
import 'package:login_api/api.dart';
import 'package:login_api/api_provider.dart';
import 'package:login_api/responses/all_users_response.dart';
import 'package:login_api/ui/pages/all_users_page.dart';
import 'package:login_api/ui/pages/page_not_found.dart';
import 'package:login_api/ui/pages/user_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ApiProvider>(
    create: (context) => ApiProvider(),
    child: MaterialApp(
      routes: {
        '/': (context) => SplachScreen(),
        AllUsersPage.routeName: (context) => AllUsersPage(),
      },
      onGenerateRoute: (settings) {
        String routeName = settings.name;
        User user = settings.arguments;
        if (routeName == UserDetailsPage.routeName) {
          return MaterialPageRoute(builder: (context) => UserDetailsPage(user));
        } else {
          return MaterialPageRoute(builder: (context) => PageNotFound());
        }
      },
    ),
  ));
}

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiProvider>(context, listen: false).getAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 0)).then((value) {
      Navigator.pushReplacementNamed(context, AllUsersPage.routeName);
    });
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
