import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/mobile_editing_courses_editing_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCoursesForms/web_editing_courses_forms_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class EditingCoursesForms extends StatelessWidget {
  const EditingCoursesForms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileEditingCoursesForms(),
          desktop: WebEditingCoursesForms(),
        ),
      ),
    );
  }
}
