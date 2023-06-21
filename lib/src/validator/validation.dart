class Validation{
  static bool isValidUser(String user) {
    return user != null && user.length > 6;
  }

  static bool isValidPhone(String phone) {
    return phone != null && phone.length > 10;
  }

  static bool isValidEmail(String email) {
    return email != null && email.length > 6 && email.contains("@");
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length > 6;
  }

  static bool isValidPassConfirm(String pass, String passConfirm) {

    return passConfirm != null && passConfirm.length > 6 && pass == passConfirm ;
  }
}