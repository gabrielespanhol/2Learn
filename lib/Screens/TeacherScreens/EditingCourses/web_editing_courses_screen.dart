import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Controlers/helper_function.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/components/card_editing_courses_view.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebEditingCourses extends StatefulWidget {
  const WebEditingCourses({
    Key? key,
  }) : super(key: key);

  @override
  State<WebEditingCourses> createState() => _WebEditingCoursesState();
}

class _WebEditingCoursesState extends State<WebEditingCourses> {
  String userName = "";
  List listClasses = [];
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
    await HelperFunctions.getUserNameFromSF().then((valueName) {
      setState(() {
        userName = valueName!;
      });
    });

//  pegar classes pelo id do tutor -- usar como base para outros metotos de pa
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .gettingClassesDataTutor(FirebaseAuth.instance.currentUser!.uid)
        .then((snapshot) {
      setState(() {
        // retorna litsa de cursos
        listClasses = snapshot;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "EDIÇÃO DE AULA",
        ),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4.3,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: (size.height + size.width) / 5,
            ),
            itemCount: listClasses.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (size.height + size.width) / 60,
                ),
                child: CardEditingCourses(course: listClasses[index]),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (size.height + size.width) / 30,
            right: (size.height + size.width) / 50,
            top: (size.height + size.width) / 280,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        ),

        //classesList()
      ],
    );
  }

  noClassesWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.add_circle,
              color: Colors.grey[700],
              size: 75,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "You've not joined any groups, tap on the add icon to create a group or also search from top search button.",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
