import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();
  SharedPreferences prefs;
  initSharedPrefrences() async {
    prefs = await SharedPreferences.getInstance();
  }

  setToken(String token) {
    prefs.setString('token', token);
  }

  String getToken() {
    return prefs.getString('token');
  }
}
