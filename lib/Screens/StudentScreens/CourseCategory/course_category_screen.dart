import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/mobile_category_search_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseCategory/web_course_category_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class CoursesCategory extends StatelessWidget {
  const CoursesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileCoursesCategory(),
          desktop: WebCoursesCategory(),
        ),
      ),
    );
  }
}
