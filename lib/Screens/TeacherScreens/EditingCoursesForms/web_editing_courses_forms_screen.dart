import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/components/editing_course_forms.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

// ignore: must_be_immutable
class WebEditingCoursesForms extends StatelessWidget {
  Classes classes;
  WebEditingCoursesForms({Key? key, required this.classes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "EDIÇÃO DE AULA ${classes.className}",
        ),
        EditingCoursesForms(
          classes: classes,
        ),
      ],
    );
  }
}
