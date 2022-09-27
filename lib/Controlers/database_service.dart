import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Models/FinalModels/user.dart';

class DatabaseServices {
  final String? uid;

  DatabaseServices({this.uid});

  // reference for our collections
  final userCollection = FirebaseFirestore.instance.collection("users");
  // final CollectionReference groupCollection =
  //     FirebaseFirestore.instance.collection("groups");
  final classCollection = FirebaseFirestore.instance.collection("classes");

  // updating the userdate
  Future savingUserData(String name, String email, String userType,
      String userSex, String cpf) async {
    return await userCollection.doc(uid).set({
      "name": name,
      "email": email,
      "userType": userType,
      "userSex": userSex,
      "cpf": cpf,
      "classes": [],
      "profilePic": " ",
      "uid": uid,
      "lastName": " ",
      "academicFormation": " ",
      "personalDescription": " ",
    });
  }

  // getting user data

  Future gettingUserData(String email) async {
    QuerySnapshot snapshot =
        await userCollection.where("email", isEqualTo: email).get();
    return snapshot;
  }

  getUserData(String userID) async {
    try {
      QuerySnapshot snapshot =
          await userCollection.where("uid", isEqualTo: userID).get();

      return snapshot.docs
          .map((json) => Users(
                academicFormation: json['academicFormation'],
                email: json['email'],
                cpf: json['cpf'],
                lastName: json['lastName'],
                name: json['name'],
                personalDescription: json['personalDescription'],
                profilePic: json['profilePic'],
                uid: json['uid'],
                userSex: json['userSex'],
                userType: json['userType'],
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future updatingUserData(
    String name,
    String lastName,
    String academicFormation,
    String personalDescription,
  ) async {
    return await userCollection.doc(uid).update({
      "name": name,
      "lastName": lastName,
      "academicFormation": academicFormation,
      "personalDescription": personalDescription,
    });
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

  // METODO QUE PEGA AS CLASSES PELA CATEGORIA -- USAR COMO BASE PARA OUTRAS QUERYS
  Future gettingClassesCategory(String category) async {
    try {
      QuerySnapshot snapshot =
          await classCollection.where("category", isEqualTo: category).get();
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
    await classCollection.doc(idClasse).update({
      "className": className,
      "classId": idClasse,
      "description": description,
      "shortDescription": shortDescription,
      "durationClasses": durationClasses,
      "numberClasses": numberClasses,
      "valueClasses": valueClasses,
      "category": category,
    });
  }
}
