import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/default_button.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/courses.dart';
import 'package:flutter_web_1/Screens/StudentScreens/Components/menu_student.dart';
import 'package:flutter_web_1/Screens/StudentScreens/ContractedCourses/components/course_card_studente_view.dart';

class WebContractedCourses extends StatelessWidget {
  const WebContractedCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    Courses matematica = Courses(
        id: 1,
        nomeCurso: "Porcentagem Basica",
        aulaRealizada: 2,
        nomeTutor: "Douglas",
        tipoCurso: "math",
        totalAulas: 3,
        proximoEncontro: "2° Feira");

    Courses machinelearning = Courses(
        id: 1,
        nomeCurso: "NUMPY P/MACHINE LEARNING",
        aulaRealizada: 5,
        nomeTutor: "Carmen",
        tipoCurso: "machinelearning",
        totalAulas: 6,
        proximoEncontro: "Amanhã");

    return Column(
      children: [
        const MenuStudent(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CourseCardStudent(
              course: matematica,
            ),
            CourseCardStudent(
              course: machinelearning,
            ),
            CourseCardStudent(
              course: matematica,
            ),
            CourseCardStudent(
              course: machinelearning,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (size.height + size.width) / 30,
            right: (size.height + size.width) / 50,
            top: (size.height + size.width) / 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              LogoImage(width: 90),
              DefaultButton(text: "OUTROS TEMAS", press: "/pesquisaCursos")
            ],
          ),
        ),
      ],
    );
  }
}
