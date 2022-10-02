import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/mobile_view_classes_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/web_editing_courses_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class EditingCourses extends StatelessWidget {
  const EditingCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileEditingCourses(),
          desktop: WebEditingCourses(),
        ),
      ),
    );
  }
}
