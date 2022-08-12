import 'package:flutter/material.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/components/course_card_studente_view.dart';

class WebContractedCourses extends StatelessWidget {
  const WebContractedCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const MenuStudent(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            CourseCardStudent(
              image: "assets/icons/calculator.svg",
              textDescripiton: "PORCENTAGEM: BÁSICA",
            ),
            CourseCardStudent(
              image: "assets/icons/calculator.svg",
              textDescripiton: "PORCENTAGEM: BÁSICA",
            ),
            CourseCardStudent(
              image: "assets/icons/calculator.svg",
              textDescripiton: "PORCENTAGEM: BÁSICA",
            )
          ],
        )
      ],
    );
  }
}
