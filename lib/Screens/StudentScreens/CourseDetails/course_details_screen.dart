import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Models/teachers.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/mobile_course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/web_course_details_screen.dart';
import 'package:flutter_web_1/responsive.dart';

// ignore: must_be_immutable
class CourseDetails extends StatefulWidget {
  Teachers? teachers = Teachers();
  CourseDetails({Key? key, this.teachers}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    Teachers? teacher = ModalRoute.of(context)!.settings.arguments as Teachers?;
    Teachers teachers = Teachers(categoria: "Categoria não encontrada");
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileCourseDetails(),
          desktop: WebCourseDetails(
            teachers: teacher ?? teachers,
          ),
        ),
      ),
    );
  }
}
