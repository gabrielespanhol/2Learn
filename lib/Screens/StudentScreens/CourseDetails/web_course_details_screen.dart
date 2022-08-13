import 'package:flutter/material.dart';

import '../Components/menu_student_search.dart';

class WebCourseDetails extends StatelessWidget {
  String? category;
  WebCourseDetails({
    Key? key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MenuStudentSearch(title: category),
      ],
    );
  }
}
