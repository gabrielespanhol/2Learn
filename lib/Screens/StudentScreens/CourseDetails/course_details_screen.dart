import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/mobile_course_details_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/CourseDetails/web_course_details_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class CourseDetails extends StatefulWidget {
  String? category;
  CourseDetails({Key? key, this.category}) : super(key: key);

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    var courseCategory = ModalRoute.of(context)?.settings.arguments;
    return Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: const MobileCourseDetails(),
          desktop: WebCourseDetails(
            category: courseCategory.toString(),
          ),
        ),
      ),
    );
  }
}
