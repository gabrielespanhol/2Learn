import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PublishedCourseContent/mobile_published_course_content_screen.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/PublishedCourseContent/web_published_course_content_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class PublishedCourseContent extends StatelessWidget {
  const PublishedCourseContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobilePublishedCourseContent(),
          desktop: WebPublishedCourseContent(),
        ),
      ),
    );
  }
}
