import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Models/FinalModels/classes.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/mobile_editing_courses_editing_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/web_editing_courses_forms_screen.dart';
import 'package:flutter_web_1/responsive.dart';

// ignore: must_be_immutable
class EditingCoursesForms extends StatelessWidget {
  Classes? classes;
  EditingCoursesForms({Key? key, this.classes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Classes? classes = ModalRoute.of(context)!.settings.arguments as Classes?;
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileEditingCoursesForms(),
          desktop: WebEditingCoursesForms(
            classes: classes!,
          ),
        ),
      ),
    );
  }
}
