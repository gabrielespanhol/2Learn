import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/mobile_home_teacher_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/HomeTeacher/web_home_teacher_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class HomeTeacher extends StatelessWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileHomeTeacher(),
          desktop: WebHomeTeacher(),
        ),
      ),
    );
  }
}
