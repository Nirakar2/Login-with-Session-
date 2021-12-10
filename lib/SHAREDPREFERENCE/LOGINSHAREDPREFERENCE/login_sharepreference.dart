import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginSharedPref {
  get prefs => null;

  Map<String, dynamic> x = {};

  Map<String, dynamic> namevariable = {"Name": "ashish", "Password": "stha"};

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('logindetail', jsonEncode(namevariable));
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = await prefs.getString('logindetail');
    x = jsonDecode(stringValue!);
    return x;
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
  }
}
