import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/empty_screen.dart';
import 'package:flutter_web_1/Screens/Components/logo_image.dart';
import 'package:flutter_web_1/Controlers/auth_service.dart';
import 'package:flutter_web_1/Controlers/database_service.dart';
import 'package:flutter_web_1/Models/contracted_classes.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/ViewClasses/components/course_card_teacher_view.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebViewClasses extends StatefulWidget {
  const WebViewClasses({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewClasses> createState() => _WebViewClassesState();
}

class _WebViewClassesState extends State<WebViewClasses> {
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
        .gettingClassesContractedTutor(FirebaseAuth.instance.currentUser!.uid)
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
          caminhofoto: "${FirebaseAuth.instance.currentUser!.uid}.png",
          textoMenu: "VISUALIZAÇÃO DE AULAS",
        ),
        if (listClasses.length > 0)
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
                  child: CourseCardTeacher(course: listClasses[index]),
                );
              },
            ),
          ),
        if (listClasses.isEmpty)
          const EmptyScreen(texto: "Nenhuma aula está agendada."),
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
      ],
    );
  }
}
