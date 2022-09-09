import 'package:flutter/material.dart';
import 'package:flutter_web_1/Components/logo_image.dart';
import 'package:flutter_web_1/Models/courses.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/EditingCourses/components/card_editing_courses_view.dart';
import 'package:flutter_web_1/Screens/TeacherScreens/components/menu_teacher.dart';

class WebEditingCourses extends StatelessWidget {
  const WebEditingCourses({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // ignore: non_constant_identifier_names
    List<Courses> CourseCategoryList = [
      Courses(
        id: 1,
        nomeCurso: "Porcentagem Basica",
        aulaRealizada: 2,
        nomeTutor: "Douglas",
        nomeAluno: "Thiago",
        tipoCurso: "math",
        totalAulas: 3,
        proximoEncontro: "2° Feira",
      ),
      Courses(
        id: 1,
        nomeCurso: "NUMPY P/MACHINE LEARNING",
        aulaRealizada: 5,
        nomeTutor: "Carmen",
        nomeAluno: "Isadora",
        tipoCurso: "machinelearning",
        totalAulas: 6,
        proximoEncontro: "Amanhã",
      ),
      Courses(
        id: 1,
        nomeCurso: "Python basico",
        aulaRealizada: 5,
        nomeTutor: "Leonardo",
        nomeAluno: "Pedro",
        tipoCurso: "machinelearning",
        totalAulas: 6,
        proximoEncontro: "3° Feira",
      ),
      Courses(
        id: 1,
        nomeCurso: "Arquitetura de dados",
        aulaRealizada: 1,
        nomeTutor: "Gabriel",
        nomeAluno: "Felipe",
        tipoCurso: "machinelearning",
        totalAulas: 5,
        proximoEncontro: "6° Feira",
      ),
    ];

    return Column(
      children: [
        MenuTeacher(
          caminhofoto: "Bella.png",
          textoMenu: "VISUALIZAÇÃO DE AULAS",
        ),
        SizedBox(
          width: (size.height + size.width) / 1.7,
          height: (size.height + size.width) / 4.3,
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
                child: CardEditingCourses(course: CourseCategoryList[index]),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: (size.height + size.width) / 30,
            right: (size.height + size.width) / 50,
            top: (size.height + size.width) / 280,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const <Widget>[
              LogoImage(width: 90),
            ],
          ),
        ),
      ],
    );
  }
}
