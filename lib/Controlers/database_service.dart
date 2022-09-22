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
  Future updateUserData(String fullname, String email) async {
    return await userCollection.doc(uid).set({
      "fullname": fullname,
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid
    });
  }
}
