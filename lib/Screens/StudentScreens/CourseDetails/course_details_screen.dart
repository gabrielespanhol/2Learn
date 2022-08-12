import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/mobile_course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/web_course_details_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileCourseDetails(),
          desktop: WebCourseDetails(),
        ),
      ),
    );
  }
}