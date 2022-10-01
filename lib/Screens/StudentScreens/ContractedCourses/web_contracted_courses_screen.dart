import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/default_button.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Components/information_bar.dart';
import 'package:flutter_web_1/Models/FinalModels/contracted_classes.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/components/course_card_studente_view.dart';

class WebContractedCourses extends StatefulWidget {
  const WebContractedCourses({
    Key? key,
  }) : super(key: key);

  @override
  State<WebContractedCourses> createState() => _WebContractedCoursesState();
}

class _WebContractedCoursesState extends State<WebContractedCourses> {
  List<ContractedClasses> listClasses = [];
  AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    gettingUserData();
  }

  gettingUserData() async {
//  pegar classes pelo id do tutor -- usar como base para outros metotos de pa
    await DatabaseServices(uid: FirebaseAuth.instance.currentUser!.uid)
        .gettingClassesContractedAluno(FirebaseAuth.instance.currentUser!.uid)
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
        const InformationBar(title: "Suas Aulas"),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4.0,
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
                child: CourseCardStudent(course: listClasses[index]),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const LogoImage(width: 90),
              DefaultButton(
                text: "OUTROS TEMAS",
                press: "/pesquisaCursosCategoria",
              )
            ],
          ),
        ),
      ],
    );
  }
}
