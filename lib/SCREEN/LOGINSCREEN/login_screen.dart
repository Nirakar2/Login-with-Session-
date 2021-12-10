import 'package:flutter/material.dart';
import 'package:loginwithsession/STATE/LOGINSTATE/login_state.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> x = {};

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LoginProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(
      builder: (BuildContext context, state, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Login Page'),
            automaticallyImplyLeading: false,
          ),
          body: Form(
            key: state.formKey,
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('images/img3.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        controller: state.text1,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            state.formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 20.0, top: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_box_rounded,
                            color: Colors.blue,
                          ),
                          hintText: "Username",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        maxLines: 1,
                        obscureText: true,
                        controller: state.text2,
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            state.formKey.currentState!.validate();
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              left: 20.0, bottom: 20.0, top: 8.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              15.0,
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.account_box_outlined,
                            color: Colors.blue,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const Center(
                        child: Text(
                      'Forgot Password ?',
                      style: TextStyle(color: Colors.blue),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          state.onClickBtn(context);
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
