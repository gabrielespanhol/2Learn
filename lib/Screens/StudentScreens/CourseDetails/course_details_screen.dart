import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Models/classes.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/mobile_course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/web_course_details_screen.dart';
import 'package:flutter_web_1/responsive.dart';

// ignore: must_be_immutable
class CourseDetails extends StatefulWidget {
  Classes? classes = Classes();
  CourseDetails({Key? key, this.classes}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    Classes? classes = ModalRoute.of(context)!.settings.arguments as Classes?;

    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileCourseDetails(),
          desktop: WebCourseDetails(
            classes: classes!,
          ),
        ),
      ),
    );
  }
}
