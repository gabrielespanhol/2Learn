import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student_search.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ViewCourses/components/course_card_view.dart';

class WebViewCourses extends StatelessWidget {
  final String category;
  const WebViewCourses({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    Teachers teacher = Teachers();

    return Column(
      children: [
        MenuStudentSearch(title: category),
        CourseCardView(teacher: teacher)
      ],
    );
  }
}
