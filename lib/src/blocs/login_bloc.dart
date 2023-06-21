import 'dart:async';

import 'package:taxi_app/src/utils/my_string.dart';
import 'package:taxi_app/src/validator/validation.dart';

class LoginBloc{
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();


  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;


  bool isValidUserInfo(String email, String pass) {
    if(!Validation.isValidUser(email)) {
      _emailController.sink.addError(emailErr);
      return false;
    }
    _emailController.sink.add("ok");
    if(!Validation.isValidPass(pass)) {
      _passController.sink.addError(passErr);
      return false;
    }

    _passController.sink.add("ok");
    return true;
  }

  void dispose() {
    _emailController.close();
    _passController.close();
  }
}