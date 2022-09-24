import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  // reference for our collections
  final userCollection = FirebaseFirestore.instance.collection("users");
  // final CollectionReference groupCollection =
  //     FirebaseFirestore.instance.collection("groups");
  final classCollection = FirebaseFirestore.instance.collection("classes");

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

  // METODO QUE PEGA AS CLASSES PELO ID DO TUTOR -- USAR COMO BASE PARA OUTRAS QUERYS
  Future gettingClassesDataTutor(String tutorId) async {
    try {
      QuerySnapshot snapshot =
          await classCollection.where("tutorId", isEqualTo: tutorId).get();
      return snapshot.docs
          .map((json) => Classes(
                category: json['category'],
                classId: json['classId'],
                className: json['className'],
                description: json['description'],
                durationClasses: json['durationClasses'],
                numberClasses: json['numberClasses'],
                shortDescription: json['shortDescription'],
                tutorId: json['tutorId'],
                tutorName: json['tutorName'],
                valueClasses: json['valueClasses'],
              ))
          .toList();
    } catch (e) {
      return [];
    }
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

  Future updateClass(
    String idClasse,
    String className,
    String description,
    String shortDescription,
    String durationClasses,
    String numberClasses,
    String valueClasses,
    String category,
  ) async {
    await classCollection.doc(idClasse).set({
      "className": className,
      "classId": "",
      "description": description,
      "shortDescription": shortDescription,
      "durationClasses": durationClasses,
      "numberClasses": numberClasses,
      "valueClasses": valueClasses,
      "category": category,
    });
  }
}
