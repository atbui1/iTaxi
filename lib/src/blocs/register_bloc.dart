import 'dart:async';

import 'package:taxi_app/src/utils/my_string.dart';
import 'package:taxi_app/src/validator/validation.dart';

class RegisterBloc{
  final StreamController _userController = StreamController();
  final StreamController _phoneController = StreamController();
  final StreamController _emailController = StreamController();
  final StreamController _passController = StreamController();
  final StreamController _passConfirmController = StreamController();


  Stream get userStream => _userController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get passStream => _passController.stream;
  Stream get passConfirmStream => _passConfirmController.stream;

  bool isValidUserInfo(String username, String phone, String email, String pass, String passConfirm) {
    if(!Validation.isValidUser(username)) {
      _userController.sink.addError(userErr);
      return false;
    }
    _userController.sink.add("ok");

    if(!Validation.isValidPhone(phone)) {
      _phoneController.sink.addError(phoneErr);
      return false;
    }
    _phoneController.sink.add("ok");

    if(!Validation.isValidEmail(email)) {
      _emailController.sink.addError(emailErr);
      return false;
    }
    _emailController.sink.add("ok");

    if(!Validation.isValidPass(pass)) {
      _passController.sink.addError(passErr);
      return false;
    }
    _passController.sink.add("ok");

    if(!Validation.isValidPassConfirm(pass, passConfirm)) {
      _passConfirmController.sink.addError(passConfirmErr);
      return false;
    }
    _passConfirmController.sink.add("ok");


    return true;
  }

  void dispose() {
    _userController.close();
    _phoneController.close();
    _emailController.close();
    _passController.close();
    _passConfirmController.close();
  }

}