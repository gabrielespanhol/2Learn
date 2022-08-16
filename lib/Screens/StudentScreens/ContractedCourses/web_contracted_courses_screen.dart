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

    // Courses matematica = Courses(
    //     id: 1,
    //     nomeCurso: "Porcentagem Basica",
    //     aulaRealizada: 2,
    //     nomeTutor: "Douglas",
    //     tipoCurso: "math",
    //     totalAulas: 3,
    //     proximoEncontro: "2° Feira");

    // Courses machinelearning = Courses(
    //     id: 1,
    //     nomeCurso: "NUMPY P/MACHINE LEARNING",
    //     aulaRealizada: 5,
    //     nomeTutor: "Carmen",
    //     tipoCurso: "machinelearning",
    //     totalAulas: 6,
    //     proximoEncontro: "Amanhã");

    // ignore: non_constant_identifier_names
    List<Courses> CourseCategoryList = [
      Courses(
          id: 1,
          nomeCurso: "Porcentagem Basica",
          aulaRealizada: 2,
          nomeTutor: "Douglas",
          tipoCurso: "math",
          totalAulas: 3,
          proximoEncontro: "2° Feira"),
      Courses(
          id: 1,
          nomeCurso: "NUMPY P/MACHINE LEARNING",
          aulaRealizada: 5,
          nomeTutor: "Carmen",
          tipoCurso: "machinelearning",
          totalAulas: 6,
          proximoEncontro: "Amanhã"),
      Courses(
          id: 1,
          nomeCurso: "Python basico",
          aulaRealizada: 5,
          nomeTutor: "Leonardo",
          tipoCurso: "machinelearning",
          totalAulas: 6,
          proximoEncontro: "3° Feira"),
      Courses(
          id: 1,
          nomeCurso: "Arquitetura de dados",
          aulaRealizada: 1,
          nomeTutor: "Gabriel",
          tipoCurso: "machinelearning",
          totalAulas: 5,
          proximoEncontro: "6° Feira"),

      ///
      ///
      ///
      ///
      Courses(
          id: 1,
          nomeCurso: "Porcentagem Basica",
          aulaRealizada: 2,
          nomeTutor: "Douglas",
          tipoCurso: "math",
          totalAulas: 3,
          proximoEncontro: "2° Feira"),
      Courses(
          id: 1,
          nomeCurso: "NUMPY P/MACHINE LEARNING",
          aulaRealizada: 5,
          nomeTutor: "Carmen",
          tipoCurso: "machinelearning",
          totalAulas: 6,
          proximoEncontro: "Amanhã"),
      Courses(
          id: 1,
          nomeCurso: "Python basico",
          aulaRealizada: 5,
          nomeTutor: "Leonardo",
          tipoCurso: "machinelearning",
          totalAulas: 6,
          proximoEncontro: "3° Feira"),
      Courses(
          id: 1,
          nomeCurso: "Arquitetura de dados",
          aulaRealizada: 1,
          nomeTutor: "Gabriel",
          tipoCurso: "machinelearning",
          totalAulas: 5,
          proximoEncontro: "6° Feira"),
    ];

    return Column(
      children: [
        const MenuStudent(),

        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: (size.height + size.width) / 5,
            ),
            itemCount: CourseCategoryList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: (size.height + size.width) / 60,
                ),
                child: CourseCardStudent(course: CourseCategoryList[index]),
              );
            },
          ),
        ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: <Widget>[
        //     CourseCardStudent(
        //       course: matematica,
        //     ),
        //     CourseCardStudent(
        //       course: machinelearning,
        //     ),
        //     CourseCardStudent(
        //       course: matematica,
        //     ),
        //     CourseCardStudent(
        //       course: machinelearning,
        //     ),
        //   ],
        // ),

        Padding(
          padding: EdgeInsets.only(
            left: (size.height + size.width) / 30,
            right: (size.height + size.width) / 50,
            top: (size.height + size.width) / 280,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const LogoImage(width: 90),
              DefaultButton(
                text: "OUTROS TEMAS",
                press: "/pesquisaCursosCategoria",
              )
            ],
          ),
        ),
      ],
    );
  }
}
