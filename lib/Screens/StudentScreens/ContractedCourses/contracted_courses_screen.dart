import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/Components/background.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/mobile_contracted_courses_screen.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/web_contracted_courses_screen.dart';
import 'package:flutter_web_1/responsive.dart';

class ContractedCourses extends StatelessWidget {
  const ContractedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: Responsive(
          mobile: MobileContractedCourses(),
          desktop: WebContractedCourses(),
        ),
      ),
    );
  }
}
