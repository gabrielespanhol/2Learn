import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/components/personal_informations_editing.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

// ignore: must_be_immutable
class WebPersonalInformationsEditing extends StatelessWidget {
  Classes classes;
  WebPersonalInformationsEditing({Key? key, required this.classes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "EDIÇÃO DE AULA ${classes.className}",
        ),
        const PersonalInformationsEditingForms(),
      ],
    );
  }
}
