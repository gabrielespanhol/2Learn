import 'package:flutter/material.dart';
import 'package:flutter_web_1/Models/teachers.dart';

import '../Components/menu_student_search.dart';

// ignore: must_be_immutable
class WebCourseDetails extends StatelessWidget {
  Teachers? teachers = Teachers();
  WebCourseDetails({
    Key? key,
    this.teachers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        MenuStudentSearch(title: teachers!.categoria.toString()),
      ],
    );
  }
}
