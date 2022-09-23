import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  // reference for our collections
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  // final CollectionReference groupCollection =
  //     FirebaseFirestore.instance.collection("groups");
  final CollectionReference classCollection =
      FirebaseFirestore.instance.collection("classes");

  // updating the userdate
  Future savingUserData(
      String fullname, String email, String userType, String userSex) async {
    return await userCollection.doc(uid).set({
      "fullName": fullname,
      "email": email,
      "userType": userType,
      "userSex": userSex,
      "classes": [],
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

  // teste para pegar classes

  // get user groups
  getUserClass() async {
    return userCollection.doc(uid).snapshots();
  }

  // criando a aula

  Future createClass(
    String userName,
    String id,
    String className,
    String description,
    String shortDescription,
    String durationClasses,
    String numberClasses,
    String valueClasses,
    String category,
  ) async {
    DocumentReference classDocumentReference = await classCollection.add({
      "tutorId": id,
      "tutorName": userName,
      "className": className,
      "members": [],
      "classId": "",
      "description": description,
      "shortDescription": shortDescription,
      "durationClasses": durationClasses,
      "numberClasses": numberClasses,
      "valueClasses": valueClasses,
      "category": category,
    });

    // atualiza o id da aula
    await classDocumentReference.update({
      "members": FieldValue.arrayUnion(["${id}_$userName"]),
      "classId": classDocumentReference.id
    });

    DocumentReference userDocumentReference = userCollection.doc(uid);
    return await userDocumentReference.update({
      "classes":
          FieldValue.arrayUnion(["${classDocumentReference.id}_$className"])
    });
  }
}
