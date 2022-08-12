import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/mobile_view_courses_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/web_view_courses_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class ViewCourses extends StatelessWidget {
  const ViewCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileViewCourses(),
          desktop: WebViewCourses(),
        ),
      ),
    );
  }
}
