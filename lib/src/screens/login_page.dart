
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/blocs/login_bloc.dart';
import 'package:taxi_app/src/screens/register_page.dart';
import 'package:taxi_app/src/screens/show_map.dart';
import 'package:taxi_app/src/utils/my_edittext.dart';

import '../utils/my_string.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {

  @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _showPass = true;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();

  LoginBloc loginBloc = LoginBloc();
  MyEdittext myEdittext = MyEdittext();


  @override
  void dispose() {
    loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Container(
          constraints: const BoxConstraints.expand(),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/img_car_1.jpg'),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(20),
                    child: const Text(
                      "Hello\nWelcome iTaxi",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        backgroundColor: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: StreamBuilder(
                        stream: loginBloc.emailStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: snapshot.hasError
                                      ? Colors.red
                                      : Colors.deepPurple),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              errorStyle: const TextStyle(color: Colors.red),
                              floatingLabelStyle: TextStyle(
                                  color: snapshot.hasError
                                      ? Colors.red
                                      : Colors.cyanAccent),
                              prefixIcon: Container(
                                padding: const EdgeInsets.all(10),
                                width: 30,
                                child: Image.asset(
                                  "assets/icons/ic_user.png",
                                  color: Colors.black,
                                ),
                              ),
                              border: myEdittext.myInputBorder(),
                              enabledBorder: myEdittext.myInputBorder(),
                              focusedBorder: myEdittext.myFocusBorder(),
                            ),
                          );
                        }),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: StreamBuilder(
                        stream: loginBloc.passStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            controller: _passTextController,
                            obscureText: _showPass,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 15,
                                  color: snapshot.hasError
                                      ? Colors.red
                                      : Colors.deepPurple),
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              errorStyle: const TextStyle(color: Colors.red),
                              floatingLabelStyle: TextStyle(
                                  color: snapshot.hasError
                                      ? Colors.red
                                      : Colors.cyanAccent),
                              prefixIcon: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 30,
                                  child: Image.asset("assets/icons/ic_pass.png",
                                      color: Colors.black)),
                              suffixIcon: GestureDetector(
                                onTap: showHidePass,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  width: 30,
                                  child: _showPass
                                      ? Image.asset(
                                          "assets/icons/ic_eye_hide.png",
                                          color: Colors.black,
                                        )
                                      : Image.asset(
                                          "assets/icons/ic_eye_show.png",
                                          color: Colors.black,
                                        ),
                                ),
                              ),
                              border: myEdittext.myInputBorder(),
                              enabledBorder: myEdittext.myInputBorder(),
                              focusedBorder: myEdittext.myFocusBorder(),
                            ),
                          );
                        }),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      child: const Text("forget password",
                          style: TextStyle(color: Colors.blue))),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: ElevatedButton(
                      onPressed: () {
                        onSignInClick(context);
                      },
                      // onPressed: ()=> {onSignInClick(context)},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          elevation: 10,
                          shadowColor: Colors.green.withOpacity(0.5),
                          side: const BorderSide(width: 2, color: Colors.cyan)),
                      child: const Text(
                        "SignIn",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.red,
                    child: RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                          const TextSpan(
                              text: "No account? ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.pink)),
                          TextSpan(
                              text: "Sing up for new user",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => _gotoRegister(context))
                        ],
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print(
                                  "zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showHidePass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignInClick1() {
    // if (loginBloc.isValidUserInfo(_emailTextController.text, _passTextController.text)) {
      Navigator.push(context, MaterialPageRoute(builder: _gotoHome));
    // }
  }

  void onSignInClick(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
      builder: (context) => HomePage()));
  }

  Widget _gotoHome(BuildContext context) {
    return HomePage();
  }
  
  void _gotoRegister(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
    // Navigator.pushReplacement(
    //   context,MaterialPageRoute(builder: (context) => RegisterPage()),);
  }
}