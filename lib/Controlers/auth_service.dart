import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login

  // register

  Future registerUserWithEmailandPassword(
      String fullname, String email, String password) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;

      if (user != null) {
        // call our database service to update the user data.
        DatabaseServices(uid: user.uid).updateUserData(fullname, email);

        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      return e;
    }
  }

  // signout

}
