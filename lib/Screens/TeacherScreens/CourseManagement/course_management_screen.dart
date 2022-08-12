import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/CourseManagement/mobile_course_management_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/CourseManagement/web_course_management_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class CourseManagement extends StatelessWidget {
  const CourseManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileCourseManagement(),
          desktop: WebCourseManagement(),
        ),
      ),
    );
  }
}
