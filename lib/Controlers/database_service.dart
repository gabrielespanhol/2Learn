import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  // updating the userdate
  Future savingUserData(
      String fullname, String email, String userType, String userSex) async {
    return await userCollection.doc(uid).set({
      "fullName": fullname,
      "email": email,
      "userType": userType,
      "userSex": userSex,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }

  // getting user data

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }
}
