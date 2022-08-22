import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/components/menu_teacher.dart';

class WebRegisterCourses extends StatelessWidget {
  const WebRegisterCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "CADASTRO DE AULA",
        ),
        Row(
          children: <Widget>[],
        )
      ],
    );
  }
}
