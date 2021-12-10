import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'SCREEN/LOGINSCREEN/login_screen.dart';
import 'STATE/LOGINSTATE/login_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: const MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
