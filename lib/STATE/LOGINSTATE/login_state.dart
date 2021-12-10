import 'package:flutter/material.dart';
import 'package:loginwithsession/SHAREDPREFERENCE/LOGINSHAREDPREFERENCE/login_sharepreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController text1 = TextEditingController();
  final TextEditingController text2 = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late Map<String, dynamic> x;

  LoginProvider() {
    x = {};
  }
  init() async {
    await setSharedPreference();
  }

  setSharedPreference() async {
    await LoginSharedPref().addStringToSF();
  }

  getSharedPreference() async {
    x = await LoginSharedPref().getStringValuesSF();
    print(x['Name']);
    print(x['Password']);
    notifyListeners();
  }

  removeSharedPreference() {
    LoginProvider().removeSharedPreference();
    notifyListeners();
  }

  onClickBtn(context) {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
    getSharedPreference();
    // print('hello');
    // print(x['Name']);
    // print(x['Password']);
    // print(text1.text);
    // print(text2.text);

    if (x['Name'] == text1.text && x['Password'] == text2.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Valid Username and Password')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid Username and Password')),
      );
      text1.clear();
      text2.clear();
    }
  }
}
