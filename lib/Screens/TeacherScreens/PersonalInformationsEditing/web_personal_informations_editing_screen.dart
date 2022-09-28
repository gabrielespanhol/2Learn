import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/components/image_editing.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/components/personal_informations_editing_forms.dart';

import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebPersonalInformationsEditing extends StatelessWidget {
  const WebPersonalInformationsEditing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "logo.png",
          textoMenu: "Edição de dados pessoais",
        ),
        ImageEditing(),
        const PersonalInformationsEditingForms(),
      ],
    );
  }
}
