import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/RegisterCourses/mobile_register_courses_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/RegisterCourses/web_register_courses_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class RegisterCourses extends StatelessWidget {
  const RegisterCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileRegisterCourses(),
          desktop: WebRegisterCourses(),
        ),
      ),
    );
  }
}
