import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


class FireAuth{

   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerWithFirebase(String username, String phone, String email, String password) {
    _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((value) =>
    {
      print("value user: $value")
      // _createUserInRealtimeDB(value.user.uid, username, phone, email, password)
    }).catchError((onError) {
      print("value user: $onError");
    });
  }

   _createUserInRealtimeDB(String userId, String username, String phone, String email, String password) {
    var user = {"name":username, "phone":phone, "email":email};
    var ref = FirebaseDatabase.instance.reference().child("users"); //tbl user
    ref.child(userId).set(user).then((value) => {
    //
    }).catchError((onError){
      //
    });
  }
}