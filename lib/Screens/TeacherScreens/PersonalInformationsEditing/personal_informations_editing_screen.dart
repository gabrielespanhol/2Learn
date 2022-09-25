import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/mobile_personal_informations_editing_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/web_personal_informations_editing_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class PersonalInformationsEditing extends StatelessWidget {
  Classes? classes;
  PersonalInformationsEditing({Key? key, this.classes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Classes? classes = ModalRoute.of(context)!.settings.arguments as Classes?;
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobilePersonalInformationsEditing(),
          desktop: WebPersonalInformationsEditing(
            classes: classes!,
          ),
        ),
      ),
    );
  }
}
