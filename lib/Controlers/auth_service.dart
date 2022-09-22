import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // login

  Future loginWithUserNameandPassword(
    String email,
    String password,
  ) async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;

      // ignore: unnecessary_null_comparison
      if (user != null) {
        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // register

  Future registerUserWithEmailandPassword(
    String fullname,
    String email,
    String password,
    String userType,
    String userSex,
  ) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
      // ignore: unnecessary_null_comparison
      if (user != null) {
        // call our database service to update the user data.
        DatabaseServices(uid: user.uid).savingUserData(
          fullname,
          email,
          userType,
          userSex,
        );

        return true;
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // signout

  Future signOut() async {
    try {
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }
}
