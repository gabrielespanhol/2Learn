import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/components/editing_course_forms.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebEditingCoursesForms extends StatelessWidget {
  const WebEditingCoursesForms({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "EDIÇÃO DE AULA",
        ),
        const EditingCoursesForms(),
      ],
    );
  }
}
