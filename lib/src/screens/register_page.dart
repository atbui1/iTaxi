import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/src/screens/home_page.dart';
import 'package:taxi_app/src/utils/my_edittext.dart';

import '../blocs/register_bloc.dart';

class RegisterPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // _RegisterPage createState() => _RegisterPage();
    return _RegisterPage();

  }

}

class _RegisterPage extends State<RegisterPage> {
  bool _showPass = true;
  bool _showPassConfirm = true;

  final TextEditingController _userTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passConfirmTextController = TextEditingController();

  RegisterBloc registerBloc = RegisterBloc();
  MyEdittext myEdittext = MyEdittext();

  @override
  void dispose() {
    registerBloc.dispose();
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
                  Image.asset('assets/images/img_car_2.jpg'),
                  // title text
                  Container(
                    alignment: Alignment.center,
                    color: Colors.yellow,
                    child: const Text(
                      "Welcome Aboard\nSignup iCar with simple step",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        backgroundColor: Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // username
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                    child: StreamBuilder(
                        stream: registerBloc.userStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            controller: _userTextController,
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
                  // phone number
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: StreamBuilder(
                        stream: registerBloc.phoneStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            controller: _phoneTextController,
                            decoration: InputDecoration(
                              labelText: "Phone number",
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
                                  "assets/icons/ic_phone.png",
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
                  // email
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: StreamBuilder(
                        stream: registerBloc.emailStream,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              labelText: "Email",
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
                                  "assets/icons/ic_mail.png",
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
                  // password
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        StreamBuilder(
                            stream: registerBloc.passStream,
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
                                  errorStyle:
                                      const TextStyle(color: Colors.red),
                                  floatingLabelStyle: TextStyle(
                                      color: snapshot.hasError
                                          ? Colors.red
                                          : Colors.cyanAccent),
                                  prefixIcon: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 30,
                                      child: Image.asset(
                                          "assets/icons/ic_pass.png",
                                          color: Colors.black)),
                                  border: myEdittext.myInputBorder(),
                                  enabledBorder: myEdittext.myInputBorder(),
                                  focusedBorder: myEdittext.myFocusBorder(),
                                ),
                              );
                            }),
                        GestureDetector(
                          onTap: showHidePass,
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: _showPass
                                ? Image.asset("assets/icons/ic_eye_show.png")
                                : Image.asset("assets/icons/ic_eye_hide.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  // password confirm
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        StreamBuilder(
                            stream: registerBloc.passConfirmStream,
                            builder: (context, snapshot) {
                              return TextField(
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                controller: _passConfirmTextController,
                                obscureText: _showPassConfirm,
                                decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(
                                      fontSize: 15,
                                      color: snapshot.hasError
                                          ? Colors.red
                                          : Colors.deepPurple),
                                  errorText: snapshot.hasError
                                      ? snapshot.error.toString()
                                      : null,
                                  errorStyle:
                                      const TextStyle(color: Colors.red),
                                  floatingLabelStyle: TextStyle(
                                      color: snapshot.hasError
                                          ? Colors.red
                                          : Colors.cyanAccent),
                                  prefixIcon: Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 30,
                                      child: Image.asset(
                                          "assets/icons/ic_pass.png",
                                          color: Colors.black)),
                                  border: myEdittext.myInputBorder(),
                                  enabledBorder: myEdittext.myInputBorder(),
                                  focusedBorder: myEdittext.myFocusBorder(),
                                ),
                              );
                            }),
                        GestureDetector(
                          onTap: showHidePassConfirm,
                          child: Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(10),
                            child: _showPassConfirm
                                ? Image.asset("assets/icons/ic_eye_show.png")
                                : Image.asset("assets/icons/ic_eye_hide.png"),
                          ),
                        )
                      ],
                    ),
                  ),
                  // button custom
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: ElevatedButton(
                      onPressed: () {
                        onRegisterClick();
                      },
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
                        "Register q",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  // login now
                  Container(
                    height: 100,
                    color: Colors.red,
                    child: RichText(
                        text: TextSpan(
                            children: <TextSpan>[
                          const TextSpan(
                              text: "Already account? ",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.pink)),
                          TextSpan(
                              text: "Login now",
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.blue),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    debugPrint('qqqqqqqqqqqqqqqqqqqqqqqqqqq'))
                        ],
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => print(
                                  "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww"))),
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
  void showHidePassConfirm() {
    setState(() {
      _showPassConfirm = !_showPassConfirm;
    });
  }

  void onRegisterClick() {
    // Navigator.of(context).pop();
    print('back back ...');
    Navigator.pop(context);

    // if(registerBloc.isValidUserInfo(_userTextController.text, _phoneTextController.text, _emailTextController.text,
    //     _passTextController.text, _passConfirmTextController.text)) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    // }
  }
}
