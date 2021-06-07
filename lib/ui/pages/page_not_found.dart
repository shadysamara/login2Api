import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Text(
          '404 NOT FOUND',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
