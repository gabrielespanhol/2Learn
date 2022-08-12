import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseSearch/mobile_course_search_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseSearch/web_course_search_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class CourseSearch extends StatelessWidget {
  const CourseSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileCourseSearch(),
          desktop: WebCourseSearch(),
        ),
      ),
    );
  }
}
