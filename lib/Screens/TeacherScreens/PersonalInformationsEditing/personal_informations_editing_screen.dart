import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/mobile_personal_informations_editing_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PersonalInformationsEditing/web_personal_informations_editing_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class PersonalInformationsEditing extends StatelessWidget {
  const PersonalInformationsEditing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobilePersonalInformationsEditing(),
          desktop: WebPersonalInformationsEditing(),
        ),
      ),
    );
  }
}
