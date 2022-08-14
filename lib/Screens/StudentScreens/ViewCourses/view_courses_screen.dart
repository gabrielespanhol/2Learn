import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/mobile_view_courses_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/web_view_courses_screen.dart';
import 'package:flutter_web_1/responsive.dart';

// ignore: must_be_immutable
class ViewCourses extends StatefulWidget {
  String? category;
  ViewCourses({Key? key, this.category}) : super(key: key);

  @override
  State<ViewCourses> createState() => _ViewCoursesState();
}

class _ViewCoursesState extends State<ViewCourses> {
  @override
  Widget build(BuildContext context) {
    var courseCategory = ModalRoute.of(context)?.settings.arguments;

    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileViewCourses(),
          desktop: WebViewCourses(
            category: courseCategory.toString(),
          ),
        ),
      ),
    );
  }
}
